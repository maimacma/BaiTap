using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Chuỗi kết nối lấy từ Web.config
            string connectionString = WebConfigurationManager.ConnectionStrings["ThangConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT * FROM taikhoan WHERE tendangnhap = @username AND matkhau = @password";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    // Đăng nhập thành công
                    Session["User"] = username;
                    Response.Redirect("WebForm1.aspx");
                   

                }
                else
                {
                    lblMessage.Text = "Sai tên đăng nhập hoặc mật khẩu!";
                }
            }
        }
    }
}