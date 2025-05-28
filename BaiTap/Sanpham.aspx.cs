using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    public partial class Sanpham1 : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=thang;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTatCaSanPham();
                if (Session["user"] != null)
                {
                    lblUsername.Text = "Xin chào, " + Session["user"].ToString();
                    phLogin.Visible = false;
                    phLogout.Visible = true;
                }
                else
                {
                    lblUsername.Text = "";
                    phLogin.Visible = true;
                    phLogout.Visible = false;
                }
            }
        }

        private void LoadTatCaSanPham()
        {
              conn.Open();
            string query = "SELECT * FROM SanPham";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSanPham.DataSource = dt;
                rptSanPham.DataBind();
                conn.Close();

        }
        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dangnhap.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Sanpham.aspx");
        }

    }
}