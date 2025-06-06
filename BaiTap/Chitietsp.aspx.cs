﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    public partial class Chitietsp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadChiTietSanPham();
     
              
                  
                       

                        pnlChiTiet.Visible = true;
                    
               
              
            }

        }

        private void LoadChiTietSanPham()
        {
            string masp = Request.QueryString["masanpham"];
            if (string.IsNullOrEmpty(masp))
            {
                Response.Redirect("Webform1.aspx?sp=khongco");   
            }

            string connStr = WebConfigurationManager.ConnectionStrings["ThangConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT tensanpham, hinh, dongia, mota FROM SanPham WHERE masanpham = @masp";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@masp", masp);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTenSanPham.Text = reader["tensanpham"].ToString();
                    lblGia.Text = string.Format("{0:N0} đ", reader["dongia"]);
                    lblMoTa.Text = reader["mota"].ToString();
                    imgSanPham.ImageUrl = "~/anh/" + reader["hinh"].ToString();
                    lblBreadcrumbTen.Text = reader["tensanpham"].ToString();
                    pnlChiTiet.Visible = true;
                }
                else
                {
                    pnlChiTiet.Visible = false;
                }

                reader.Close();
            }
        }
    }
}