using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Web.UI.WebControls.WebParts;

namespace BaiTap
{

    public partial class Trangchu : System.Web.UI.MasterPage
    {
       private SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=thang;Integrated Security=True");
        public string id;
        public string tb;
        public MenuItem menuitem;

        public DataTable quangcao1
        {
            get { return ViewState["quangcao1"] as DataTable; }
            set { ViewState["quangcao1"] = value; }
        }
     
        protected void Page_Load(object sender, EventArgs e)
        {

            tb = Request.QueryString["sp"];
            if (!IsPostBack)
            {
                dsqc();
                LoadSanPham();
               id = Request.QueryString["masanpham"];
                if (!string.IsNullOrEmpty(id))
                {
                   SqlDataAdapter cm = new SqlDataAdapter("SELECT masanpham, hinh FROM sanpham", conn);
                    DataTable bn = new DataTable();
                    cm.Fill(bn);
                    id = bn.Rows[0]["masanpham"].ToString();
                }
               
            }

            if (Session["User"] != null)
            {
                // Đã đăng nhập
                phLogin.Visible = false;
                phLogout.Visible = true;
                lblUsername.Text = "Xin chào, " + Session["User"];

            }
            else
            {
                // Chưa đăng nhập
                phLogin.Visible = true;
                phLogout.Visible = false;
            }

        }


        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dangnhap.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Xóa tất cả session
            Response.Redirect("~/Trangchu.aspx"); // Quay về trang chủ
        }

        protected void dsqc()
        {
            string query = "SELECT masanpham, hinh FROM sanpham WHERE quangcao = 'true'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            quangcao1 = dt;
        }

      
        private void LoadSanPham()
        {
            string query = "SELECT masanpham, tensanpham, hinh, dongia FROM SanPham";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptSanPham.DataSource = dt;
            rptSanPham.DataBind();
        }

    }
}
