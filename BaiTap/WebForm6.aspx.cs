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

        
        SqlConnection conn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=Thang;Integrated Security=True;TrustServerCertificate=True");
        public DataTable sanpham;
        public DataTable loaisanpham;
        public DataTable khachhang;
        public DataTable nhacungcap;
        public DataTable chitiethoadon;
        public DataTable taikhoan;
        public DataTable hoadon;
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
                SqlDataAdapter adapter1 = new SqlDataAdapter("Select * From sanpham", conn);
                sanpham = new DataTable();
                adapter1.Fill(sanpham);
                SqlDataAdapter adapter2 = new SqlDataAdapter("Select * From khachhang", conn);
                khachhang = new DataTable();
                adapter2.Fill(khachhang);
                SqlDataAdapter adapter3 = new SqlDataAdapter("Select * From donvisanxuat", conn);
                nhacungcap = new DataTable();
                adapter3.Fill(nhacungcap);
                SqlDataAdapter adapter4 = new SqlDataAdapter("Select * From chitiethoadon", conn);
                chitiethoadon = new DataTable();
                adapter4.Fill(chitiethoadon);
                SqlDataAdapter adapter5 = new SqlDataAdapter("Select * From taikhoan", conn);
                taikhoan = new DataTable();
                adapter5.Fill(taikhoan);
                SqlDataAdapter adapter6 = new SqlDataAdapter("Select * From hoadon", conn);
                hoadon = new DataTable();
                adapter6.Fill(hoadon);
                conn.Close();
                HttpPostedFile fileanh= Request.Files["upload"];
                if (fileanh != null && fileanh.ContentLength > 0)
                { 
                string linkanh = Server.MapPath("../anh/") + fileanh.FileName;
                    fileanh.SaveAs(linkanh);

                }
                tgiaohang.TextMode = TextBoxMode.DateTimeLocal;


            }
           
        }

        protected void doi(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            int trang = Convert.ToInt32(button.CommandArgument);
            viewthunhat.ActiveViewIndex = trang;
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Select * From loaisanpham", conn);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gri1.DataSource = dt;
            gri1.DataBind();
            SqlDataAdapter adapter1 = new SqlDataAdapter("Select * From sanpham", conn);
            sanpham = new DataTable();
            adapter1.Fill(sanpham);
            SqlDataAdapter adapter2 = new SqlDataAdapter("Select * From khachhang", conn);
            khachhang = new DataTable();
            adapter2.Fill(khachhang);
            SqlDataAdapter adapter3 = new SqlDataAdapter("Select * From donvisanxuat", conn);
            nhacungcap = new DataTable();
            adapter3.Fill(nhacungcap);
            SqlDataAdapter adapter4 = new SqlDataAdapter("Select * From chitiethoadon", conn);
            chitiethoadon = new DataTable();
            adapter4.Fill(chitiethoadon);
            SqlDataAdapter adapter5 = new SqlDataAdapter("Select * From taikhoan", conn);
            taikhoan = new DataTable();
            adapter5.Fill(taikhoan);
            SqlDataAdapter adapter6 = new SqlDataAdapter("Select * From hoadon", conn);
            hoadon = new DataTable();
            adapter6.Fill(hoadon);
            conn.Close();
            
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
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(t1.Text);
            conn.Open();
            SqlCommand cmd = new SqlCommand("Delete From loaisanpham Where maloaisanpham = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl);
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = t2.Text;
            conn.Open();
            SqlCommand cmd = new SqlCommand("Insert Into loaisanpham  Values ('"+Convert.ToInt32(t1.Text)+"','"+t2.Text+"')", conn);
            cmd.Parameters.AddWithValue("@ten", ten);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void b2_Click(object sender, EventArgs e)
        {
            t1.Text = "";
            t2.Text = "";
        }

        protected void tgiaohang_TextChanged(object sender, EventArgs e)
        {
            tgiaohang.TextMode = TextBoxMode.DateTimeLocal;
        }
    }
       
}