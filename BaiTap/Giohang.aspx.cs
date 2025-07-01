using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BaiTap
{

    public partial class Giohang : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=thang;Integrated Security=True");

        private int TaoMaHoaDonMoi()
        {
            try
            {
                con.Open();
                string sql = "SELECT ISNULL(MAX(mahoadon), 0) + 1 FROM hoadon";
                SqlCommand cmd = new SqlCommand(sql, con);
                int mahoadon = (int)cmd.ExecuteScalar();
                return mahoadon;
            }
            catch
            {
                // Xử lý lỗi nếu cần, hoặc trả về -1
                return -1;
            }
            finally
            {
                con.Close();
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGioHang();
                if (Session["user"] != null)
                {
                    // Đã đăng nhập
                    phLogin.Visible = false;
                    phLogout.Visible = true;
                    lblUsername.Text = "Xin chào, " + Session["user"];
                }
                else
                {
                    // Chưa đăng nhập
                    phLogin.Visible = true;
                    phLogout.Visible = false;
                    lblUsername.Text = "";
                }
            }
        }

        private void LoadGioHang()
        {
            DataTable dtGioHang = Session["GioHang"] as DataTable;
            if (dtGioHang != null)
            {
                gvGioHang.DataSource = dtGioHang;
                gvGioHang.DataBind();
                CapNhatTongTien(dtGioHang);
            }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {

            if (Session["GioHang"] == null || ((DataTable)Session["GioHang"]).Rows.Count == 0)
            {
             
                return;
            }

            DataTable gioHang = (DataTable)Session["GioHang"];
             string makh = Request.QueryString["makh"]; // lấy từ session đăng nhập
           // if (string.IsNullOrEmpty(makh))
           // {
                //Response.Redirect("Dangnhap.aspx");
              //  return;
            //}

            int mahoadon = TaoMaHoaDonMoi();
            DateTime ngayDat = DateTime.Now;
            DateTime ngayGiao = ngayDat.AddDays(3); // giao sau 3 ngày
            decimal tongTien = gioHang.AsEnumerable().Sum(row => Convert.ToDecimal(row["DonGia"]) * Convert.ToInt32(row["SoLuong"]));

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
            {
                conn.Open();
                SqlTransaction tran = conn.BeginTransaction();

                try
                {
                    // 1. Insert hoadon
                    string sqlHD = @"INSERT INTO hoadon (mahoadon, makh, ngaydathang, ngaygiaohang, tongtien)
                             VALUES (@mahd, @makh, @ngaydat, @ngaygiao, @tongtien)";
                    SqlCommand cmdHD = new SqlCommand(sqlHD, conn, tran);
                    cmdHD.Parameters.AddWithValue("@mahd", mahoadon);
                    cmdHD.Parameters.AddWithValue("@makh", makh);
                    cmdHD.Parameters.AddWithValue("@ngaydat", ngayDat);
                    cmdHD.Parameters.AddWithValue("@ngaygiao", ngayGiao);
                    cmdHD.Parameters.AddWithValue("@tongtien", tongTien);
                    cmdHD.ExecuteNonQuery();

                    // 2. Insert chi tiết hoá đơn
                    foreach (DataRow row in gioHang.Rows)
                    {
                        string sqlCT = @"INSERT INTO chitiethoadon (mahoadon, masanpham, soluong, dongia)
                                 VALUES (@mahd, @masp, @sl, @gia)";
                        SqlCommand cmdCT = new SqlCommand(sqlCT, conn, tran);
                        cmdCT.Parameters.AddWithValue("@mahd", mahoadon);
                        cmdCT.Parameters.AddWithValue("@masp", row["masanpham"].ToString());
                        cmdCT.Parameters.AddWithValue("@sl", Convert.ToInt32(row["soluong"]));
                        cmdCT.Parameters.AddWithValue("@gia", Convert.ToDecimal(row["dongia"]));
                        cmdCT.ExecuteNonQuery();
                    }

                    tran.Commit();

                    // Xoá giỏ hàng sau khi thanh toán
                    Session["GioHang"] = null;
                    lblThongBao.Text = "Thanh toán thành công! Mã hoá đơn: " + mahoadon;
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    lblThongBao.Text = "Lỗi khi thanh toán: " + ex.Message;
                }
            }
        }
        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dangnhap.aspx");
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // hoặc Session.Remove("makh");
            Response.Redirect("WebForm1.aspx"); // về trang chủ
        }
        protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CapNhat" || e.CommandName == "Xoa")
            {
                string masp = e.CommandArgument.ToString();

                DataTable dtGioHang = Session["GioHang"] as DataTable;
                if (dtGioHang == null)
                    return;

                if (e.CommandName == "Xoa")
                {
                    DataRow[] rows = dtGioHang.Select("masanpham = '" + masp + "'");
                    foreach (DataRow r in rows)
                    {
                        dtGioHang.Rows.Remove(r);
                    }
                }
                else if (e.CommandName == "CapNhat")
                {
                    foreach (GridViewRow row in gvGioHang.Rows)
                    {

                        string maspRow = gvGioHang.DataKeys[row.RowIndex].Value.ToString();
                        if (maspRow == masp)
                        {
                            TextBox txtSoLuong = (TextBox)row.FindControl("txtSoLuong");
                            if (txtSoLuong != null)
                            {
                                int soLuong;
                                if (int.TryParse(txtSoLuong.Text.Trim(), out soLuong) && soLuong > 0)
                                {
                                    DataRow[] rows = dtGioHang.Select("masanpham = '" + masp + "'");
                                    if (rows.Length > 0)
                                    {
                                        rows[0]["soluong"] = soLuong;
                                    }
                                }
                                else
                                {
                                    txtSoLuong.Text = "1";
                                }
                            }
                            break; // đã tìm thấy sản phẩm, thoát vòng lặp
                        }
                    }
                }

                Session["GioHang"] = dtGioHang;
                gvGioHang.DataSource = dtGioHang;
                gvGioHang.DataBind();

                CapNhatTongTien(dtGioHang);
            }
        }

        private void CapNhatTongTien(DataTable dtGioHang)
        {
            decimal tongTien = 0;
            foreach (DataRow row in dtGioHang.Rows)
            {
                decimal dongia = Convert.ToDecimal(row["DonGia"]);
                int soluong = Convert.ToInt32(row["SoLuong"]);
                tongTien += dongia * soluong;
            }
            lblTongTien.Text = tongTien.ToString("N0") + "₫";
        }

        protected void txtSoLuong_TextChanged(object sender, EventArgs e)
        {
            DataTable dtGioHang = Session["GioHang"] as DataTable;
            decimal tongTien = 0;
            foreach (DataRow row in dtGioHang.Rows)
            {
                decimal dongia = Convert.ToDecimal(row["DonGia"]);
                int soluong = Convert.ToInt32(row["SoLuong"]);
                tongTien += dongia * soluong;
            }
            lblTongTien.Text = tongTien.ToString("N0") + "₫";
        }
    }

}