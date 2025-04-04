using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Web.Mvc;
namespace BaiTap
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=THANG\SQLEXPRESS;Initial Catalog=Thang;Integrated Security=True;TrustServerCertificate=True");
        protected void Page_Load(object sender, EventArgs e)
        {
   
            if (!IsPostBack)
            {
                viewthunhat.ActiveViewIndex = 0;
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("Select * From loaisanpham",conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gri1.DataSource = dt;
                gri1.DataBind();
                conn.Close();


            }
        }

        protected void doi(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            int trang = Convert.ToInt32(button.CommandArgument);
            viewthunhat.ActiveViewIndex = trang;
        }
        protected void gri1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gri1.SelectedRow;
            t1.Text = row.Cells[0].Text; // Cột ID
            t2.Text = row.Cells[1].Text; // Cột Tên Sản Phẩm
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {

        }
    }
       
}