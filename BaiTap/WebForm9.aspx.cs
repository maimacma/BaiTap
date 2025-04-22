using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace BaiTap
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=THANG\\SQLEXPRESS;Initial Catalog=Thang;Integrated Security=True;Encrypt=False;TrustServerCertificate=True;");
        protected DataTable quangcao;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                dulieu();
            }
        }
      
public void dulieu()     
        {
            string masp = "select * from sanpham where quangcao = 'true'";
            SqlDataAdapter da = new SqlDataAdapter(masp,conn);
           quangcao = new DataTable();
            da.Fill(quangcao);
        
        }
    }
}