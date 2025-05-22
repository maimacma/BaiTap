using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    public partial class Sanpham1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["masanpham"] != null)
                {
                    string masp = Request.QueryString["masanpham"];
                    LoadChiTietSanPham(masp);
                }
                else
                {
                    Response.Redirect("WebForm1.aspx"); // quay về trang danh sách sản phẩm nếu không có mã
                }
            }
        }

        private void LoadChiTietSanPham(string masp)
        {
            string chuoiketnoi = ConfigurationManager.ConnectionStrings["ThangConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(chuoiketnoi))
            {
                string sql = "SELECT tensanpham, hinh, dongia, mota FROM sanpham WHERE masanpham = @masp";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@masp", masp);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string ten = dr["tensanpham"].ToString();
                    lblTenSanPham.Text = ten;
                  
                    imgSanPham.ImageUrl = "~/anh/" + dr["hinh"].ToString();
                    lblGia.Text = Convert.ToDecimal(dr["dongia"]).ToString("N0") + " đ";
                    lblMoTa.Text = dr["mota"].ToString();
                }
                else
                {
                    Response.Redirect("WebForm6.aspx");
                }
                dr.Close();
            }
        }
    }
   }