using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    
    public partial class Chitietsp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadChiTietSanPham();
                        pnlChiTiet.Visible = true;
            }

        }
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ThangConnectionString"].ConnectionString);
        private void LoadChiTietSanPham()
        {
            string masp = Request.QueryString["masanpham"];
            if (string.IsNullOrEmpty(masp))
            {
                Response.Redirect("Webform1.aspx?sp=khongco");   
            }

            string connStr = WebConfigurationManager.ConnectionStrings["ThangConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT tensanpham, hinh, dongia, mota FROM SanPham WHERE masanpham = @masp";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@masp", masp);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTenSanPham.Text = reader["tensanpham"].ToString();
                    lblGia.Text = string.Format("{0:N0} đ", reader["dongia"]);
                    lblMoTa.Text = reader["mota"].ToString();
                    imgSanPham.ImageUrl = "~/anh/" + reader["hinh"].ToString();
                    lblBreadcrumbTen.Text = reader["tensanpham"].ToString();
                    pnlChiTiet.Visible = true;
                }
                else
                {
                    pnlChiTiet.Visible = false;
                }

                reader.Close();
            }

        }
        protected DataTable  LayThongTinSanPham(string masp)
        {
            string domasp = Request.QueryString["masanpham"];
            connection.Open();
            SqlDataAdapter sp = new SqlDataAdapter("select * from sanpham where masanpham ='"+masp+"'",connection);
            DataTable dataTable = new DataTable();
            sp.Fill(dataTable);
            connection.Close();
            return dataTable;
        }

        protected void btnMuaNgay_Click(object sender, EventArgs e)
        {
            string masp = Request.QueryString["masanpham"];
            string makha = makh.Value;

            // Lấy thông tin sản phẩm từ DB (ví dụ)
            DataTable dtSanPham = LayThongTinSanPham(masp); // bạn tự code hàm này
            if (dtSanPham.Rows.Count > 0)
            {
                DataRow sp = dtSanPham.Rows[0];

                // Tạo hoặc lấy giỏ hàng hiện tại
                DataTable dtGioHang = Session["GioHang"] as DataTable;
                if (dtGioHang == null)
                {
                    dtGioHang = new DataTable();
                    dtGioHang.Columns.Add("MaSP");
                    dtGioHang.Columns.Add("MaSP");
                    dtGioHang.Columns.Add("TenSP");
                    dtGioHang.Columns.Add("DonGia", typeof(int));
                    dtGioHang.Columns.Add("SoLuong", typeof(int));
                    dtGioHang.Columns.Add("HinhAnh");
                }

                // Kiểm tra đã có sản phẩm trong giỏ chưa
                DataRow existing = dtGioHang.Select("MaSP = '" + masp + "'").FirstOrDefault();
                if (existing != null)
                {
                    existing["SoLuong"] = Convert.ToInt32(existing["SoLuong"]) + 1;
                }
                else
                {
                    DataRow newRow = dtGioHang.NewRow();
                    newRow["MaSP"] = masp;
                    newRow["TenSP"] = sp["TenSP"];
                    newRow["DonGia"] = sp["DonGia"];
                    newRow["SoLuong"] = 1;
                    newRow["HinhAnh"] = sp["HinhAnh"];
                    dtGioHang.Rows.Add(newRow);
                }

                Session["GioHang"] = dtGioHang;
            }

            // Redirect sang giỏ hàng (hiển thị)
            Response.Redirect("Giohang.aspx");
        }

    }
}