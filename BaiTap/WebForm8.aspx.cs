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
            if (!IsPostBack)
            {
                if (Request.QueryString["deleteID"] != null)
                {
                    DeleteLoaiSanPham(Request.QueryString["deleteID"]);
                }
                else if (Request.QueryString["editID"] != null)
                {
                    LoadDataForEdit(Request.QueryString["editID"]);
                    isEdit = true;
                }

                LoadLoaiSanPham();
            }
        }

        private void LoadLoaiSanPham()
        {
          conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM loaisanpham", conn);
                DataTable_select_loaisanpham = new DataTable();
                da.Fill(DataTable_select_loaisanpham);
            conn.Close();
        }

        private void DeleteLoaiSanPham(string id)
        {
            
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM LoaiSanPham WHERE maloaisanpham = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            conn.Close();
            // Reload the page to reflect changes

            Response.Redirect("cuahang_loaisanpham.aspx");
        }

        private void LoadDataForEdit(string id)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM LoaiSanPham WHERE maloaisanpham = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtMaLoai.Text = reader["maloaisanpham"].ToString();
                    txtTenLoai.Text = reader["tenloaisanpham"].ToString();
                }
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string ma = txtMaLoai.Text.Trim();
            string ten = txtTenLoai.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd;

                if (Request.QueryString["editID"] != null)
                {
                    // UPDATE
                    cmd = new SqlCommand("UPDATE loaisanpham SET tenloaisanpham = @ten WHERE maloaisanpham = @ma", conn);
                }
                else
                {
                    // INSERT
                    cmd = new SqlCommand("INSERT INTO loaisanpham (maloaisanpham, tenloaisanpham) VALUES (@ma, @ten)", conn);
                }

                cmd.Parameters.AddWithValue("@ma", ma);
                cmd.Parameters.AddWithValue("@ten", ten);

                try
                {
                    cmd.ExecuteNonQuery();
                    Response.Redirect("WebForm8.aspx");
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Lỗi: " + ex.Message;
                }
            }
        }

    }
}