﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using WjbuGangVer2_WebNC.Models;
using WjbuGangVer2_WebNC.VNPay;

namespace WjbuGangVer2_WebNC.Controllers
{
    public class HomeController : Controller
    {
        QLBHEntities db = new QLBHEntities();

        public ActionResult Index()
        {
            Session["PayFailed"] = null;
            return View();
        }

        public ActionResult DonHang()
        {
            if (Session["User_ID"] == null || Session["User_username"].ToString() == "")
            {
                return RedirectToAction("AccountLogic", "Account");
            }
            Account account = new Account();
            int UserID = (int)Session["User_ID"];
            var list = db.HoaDons.Where(b => b.AccountID == UserID && b.TinhTrang != 0).ToList();
            return View(list);
        }

        public ActionResult ChiTietDonHang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            List<HoaDonItem> items = new List<HoaDonItem>();
            string chiTiet = hoaDon.ChiTiet;
            string[] itemStrings = chiTiet.Split('-');
            foreach (string str in itemStrings)
            {
                int maMH = Convert.ToInt32(str.Split(':')[0]);
                int soLuong = Convert.ToInt32(str.Split(':')[1]);
                HoaDonItem newItem = new HoaDonItem();
                newItem._shopping_product = db.MatHangs.Where(a => a.MaMH == maMH).FirstOrDefault();
                newItem._shopping_quantity = soLuong;
                items.Add(newItem);
            }
            HoaDonAdmin hoaDonAdmin = new HoaDonAdmin();
            hoaDonAdmin.hoaDon = hoaDon;
            hoaDonAdmin.items = items;
            return View(hoaDonAdmin);
        }

        public ActionResult UserDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            else
            {
                hoaDon.TinhTrang = 0;
                db.Entry(hoaDon).State = EntityState.Modified;
                db.SaveChanges();
            }    
            return RedirectToAction("DonHang", "Home");
        }

        public ActionResult Payment()
        {
            string url = ConfigurationManager.AppSettings["Url"];
            string returnUrl = ConfigurationManager.AppSettings["ReturnUrl"];
            string tmnCode = ConfigurationManager.AppSettings["TmnCode"];
            string hashSecret = ConfigurationManager.AppSettings["HashSecret"];

            Paylib pay = new Paylib();
            var price = "";

            if (Session["GiaApDungVoucher"] != null)
            {
                price = (string)Session["GiaApDungVoucher"] + "00";
            }
            else
            {
                var old_price = Session["GiaKhongApDungVoucher"];
                price = old_price.ToString() + "00";
            }

            var new_price = price.Replace(",", "");

            pay.AddRequestData("vnp_Version", "2.1.0"); //Phiên bản api mà merchant kết nối. Phiên bản hiện tại là 2.1.0
            pay.AddRequestData("vnp_Command", "pay"); //Mã API sử dụng, mã cho giao dịch thanh toán là 'pay'
            pay.AddRequestData("vnp_TmnCode", tmnCode); //Mã website của merchant trên hệ thống của VNPAY (khi đăng ký tài khoản sẽ có trong mail VNPAY gửi về)
            pay.AddRequestData("vnp_Amount", new_price); //số tiền cần thanh toán, công thức: số tiền * 100 - ví dụ 10.000 (mười nghìn đồng) --> 1000000
            pay.AddRequestData("vnp_BankCode", ""); //Mã Ngân hàng thanh toán (tham khảo: https://sandbox.vnpayment.vn/apis/danh-sach-ngan-hang/), có thể để trống, người dùng có thể chọn trên cổng thanh toán VNPAY
            pay.AddRequestData("vnp_CreateDate", DateTime.Now.ToString("yyyyMMddHHmmss")); //ngày thanh toán theo định dạng yyyyMMddHHmmss
            pay.AddRequestData("vnp_CurrCode", "VND"); //Đơn vị tiền tệ sử dụng thanh toán. Hiện tại chỉ hỗ trợ VND
            pay.AddRequestData("vnp_IpAddr", Ultil.GetIpAddress()); //Địa chỉ IP của khách hàng thực hiện giao dịch
            pay.AddRequestData("vnp_Locale", "vn"); //Ngôn ngữ giao diện hiển thị - Tiếng Việt (vn), Tiếng Anh (en)
            pay.AddRequestData("vnp_OrderInfo", "Thanh toan don hang Foodain"); //Thông tin mô tả nội dung thanh toán
            pay.AddRequestData("vnp_OrderType", "other"); //topup: Nạp tiền điện thoại - billpayment: Thanh toán hóa đơn - fashion: Thời trang - other: Thanh toán trực tuyến
            pay.AddRequestData("vnp_ReturnUrl", returnUrl); //URL thông báo kết quả giao dịch khi Khách hàng kết thúc thanh toán
            pay.AddRequestData("vnp_TxnRef", DateTime.Now.Ticks.ToString()); //mã hóa đơn

            string paymentUrl = pay.CreateRequestUrl(url, hashSecret);
            return Redirect(paymentUrl);
        }

        public ActionResult PaymentConfirm()
        {
            if (Request.QueryString.Count > 0)
            {
                string hashSecret = ConfigurationManager.AppSettings["HashSecret"]; //Chuỗi bí mật
                var vnpayData = Request.QueryString;
                Paylib pay = new Paylib();

                //lấy toàn bộ dữ liệu được trả về
                foreach (string s in vnpayData)
                {
                    if (!string.IsNullOrEmpty(s) && s.StartsWith("vnp_"))
                    {
                        pay.AddResponseData(s, vnpayData[s]);
                    }
                }
                long orderId = Convert.ToInt64(pay.GetResponseData("vnp_TxnRef")); //mã hóa đơn
                long vnpayTranId = Convert.ToInt64(pay.GetResponseData("vnp_TransactionNo")); //mã giao dịch tại hệ thống VNPAY
                string vnp_ResponseCode = pay.GetResponseData("vnp_ResponseCode"); //response code: 00 - thành công, khác 00 - xem thêm https://sandbox.vnpayment.vn/apis/docs/bang-ma-loi/
                string vnp_SecureHash = Request.QueryString["vnp_SecureHash"]; //hash của dữ liệu trả về

                bool checkSignature = pay.ValidateSignature(vnp_SecureHash, hashSecret); //check chữ ký đúng hay không?

                if (checkSignature)
                {
                    if (vnp_ResponseCode == "00")
                    {   
                        //Thanh toán thành công
                        ViewBag.Message = "Thanh toán thành công hóa đơn " + orderId + " | Mã giao dịch: " + vnpayTranId;
                        return RedirectToAction("XacNhanDatHang", "HoaDon");
                    }
                    else
                    {
                        //Thanh toán không thành công. Mã lỗi: vnp_ResponseCode
                        Session["PayFailed"] = "Có lỗi xảy ra trong quá trình xử lý hóa đơn " + orderId + " | Mã giao dịch: " + vnpayTranId + " | Mã lỗi: " + vnp_ResponseCode;
                        return RedirectToAction("ShowToCart", "HoaDon");
                    }
                }
                else
                {
                    ViewBag.Message = "Có lỗi xảy ra trong quá trình xử lý";
                }
            }
            return View(Session["HoaDon"]);
        }

        public ActionResult BanTin()
        {
            return View(BanTin());
        }
    }
}
