using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=THANG\SQLEXPRESS;Initial Catalog=Thang;Integrated Security=True;TrustServerCertificate=True");
        public DataTable DataTable_select_loaisanpham;
        public bool isEdit = false;

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

    

       
    }
}