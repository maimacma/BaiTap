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
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=thang;Integrated Security=True");
        public DataTable quangcao1;
        public MenuItem menuitem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dsqc();
            }
        }
        protected void dsqc()
        {
            string masp = "select * from sanpham where quangcao = 'true'";
            SqlDataAdapter da = new SqlDataAdapter(masp, conn);
            quangcao1 = new DataTable();
            da.Fill(quangcao1);
        }
            

    }
}