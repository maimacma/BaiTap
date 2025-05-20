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
        
        public MenuItem menuitem;

        public DataTable quangcao1
        {
            get { return ViewState["quangcao1"] as DataTable; }
            set { ViewState["quangcao1"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dsqc();
                LoadSanPham();
            }
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
            string query = "SELECT masanpham, tensanpham, hinh, dongia, 34990000 AS giagoc, 13 AS giamgia, 305000 AS giamthem FROM SanPham";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptSanPham.DataSource = dt;
            rptSanPham.DataBind();
        }

    }
}
