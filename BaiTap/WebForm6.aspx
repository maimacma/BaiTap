﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="BaiTap.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .mar
        {
                   font-size: 24px;
           font-weight: bold;
           color: darkred;
           margin-bottom: 10px; 
           text-align:center;
         
        }
        .trai
        {
        width: 100%;
    border: 2px solid black;
    background-color: white;
    background-color:azure;
   
 
       
        }
        .phai{
           border:2px solid black;
            text-align:center;
            width:auto;
        min-height:200px;
       padding:0px;
       justify-content:center;
  width:100%;
      
        } 
        .conten{
            width:auto;
            height:auto;
        }
        .auto-style1 {
            width: 128px;
        }
    </style>
    <title> Quản Lý Shop</title>
</head>
<body style="background-color:wheat;">
<link href="Css/StyleSheet1.css" rel="stylesheet" type="text/css" /> 
    <form id="form1" runat="server" method="post">
        <header>
        <div class="mar">
            SHOPACCABC.COM NƠI BÁN ACCOUNT-ITEMS-CÀY THUÊ-TIỀN TỆ TRONG GAME UY TÍN
        </div>
            </header>
        <div class="conten" style="">
            <div class="trai" >
                <div style="border:solid 2px black;">
                <h3  style="background-color:aliceblue;text-align:left;padding-top:10px;color:red;margin:0px 0px 0px 0px;padding-bottom:10px">DANH MỤC QUẢN LÝ</h3>
                    </div>
          <div style="padding-bottom:5px;">
                <asp:LinkButton runat="server" Style="text-decoration:none;color:black;font-weight:bold;padding-right:30px;padding-left:10px" PostBackUrl="~/WebForm1.aspx">Trang chủ</asp:LinkButton>
                <asp:LinkButton runat="server"  Style="text-decoration:none;color:blue;font-weight:bold;padding-right:30px" CommandArgument="0" OnClick="doi">Loại sản phẩm</asp:LinkButton>
                <asp:LinkButton runat="server" Style="text-decoration:none;color:lightgreen;font-weight:bold;padding-right:30px" CommandArgument="1" OnClick="doi">Sản phẩm</asp:LinkButton>
                <asp:LinkButton runat="server" Style="text-decoration:none;color:darkblue;font-weight:bold;padding-right:30px" CommandArgument="2" OnClick="doi"> Đơn vị sản xuất</asp:LinkButton>
                <asp:LinkButton runat="server" Style="text-decoration:none;color:brown;font-weight:bold;padding-right:30px" CommandArgument="3" OnClick="doi"> Tài khoản</asp:LinkButton>
              <asp:LinkButton runat="server" Style="text-decoration: none; color: darkviolet; font-weight: bold; padding-right: 30px" CommandArgument="4" OnClick="doi">Hóa đơn</asp:LinkButton>
              <asp:LinkButton Text="Chi tiết hóa đơn"  runat="server" Style="text-decoration: none; color: darkviolet; font-weight: bold; padding-right: 30px" CommandArgument="5" OnClick="doi"> </asp:LinkButton>
               <asp:LinkButton runat="server" Style="text-decoration:none;color:ActiveBorder;font-weight:bold;padding-right:30px" CommandArgument="6" OnClick="doi"> Khách hàng</asp:LinkButton>
           </div>
                </div>
            <div class="phai">
   
                <asp:MultiView runat="server" ID="viewthunhat">
                    <asp:View runat="server" ID="view0">
                        <h2>Danh Mục Loại Sản Phẩm</h2>
                        <div style="display:flex;flex:1PX">
                        <div style="width:30%;place-items:center;place-content:center;text-align:center;padding-left:30PX">
                            <asp:Label runat="server"> Mã loại sản phẩm</asp:Label>
                <asp:TextBox runat="server" CssClass="chinhbox" ID="t1">

                </asp:TextBox>
                            <asp:Label runat="server">Tên loại sản phẩm</asp:Label>
                        <asp:TextBox runat="server" CssClass="chinhbox" ID="t2"></asp:TextBox>
                        <asp:Button runat="server" Text="Thêm" CssClass="cn" ID="b1" OnClick="btnThem_Click"/>
                            <asp:Button  runat="server" Text="hủy" ID="b2" CssClass="cn" OnClick="b2_Click" />
                            <asp:Button runat="server" Text="Xóa" ID="b3" CssClass="cn" OnClick="btnXoa_Click" />
                            </div>
                            <div style="place-items:center;place-content:right;width:100%;margin-bottom: 2px;">
                                <asp:GridView ID="gri1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gri1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField ControlStyle-Width="100%" DataField="maloaisanpham" HeaderText="Mã Lọai Sản Phẩm">
                                        <ControlStyle Width="100%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tenloaisanpham" HeaderText="Tên Loại Sản Phẩm" />
                                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            
                            </div>
                         
                            </div>
                    </asp:View>
                         <asp:View runat="server" ID="view1">
    <h2>Danh Mục Sản Phẩm
    </h2>
          <div>

               <table>
                  <tr>
                      <td>
                          <asp:Label runat="server" ID="lb1">Mã sản phẩm</asp:Label>
                      </td>
                      <td class="auto-style1">
                          <asp:TextBox runat="server" ID="tmasanpham" ReadOnly="True"></asp:TextBox>
                      </td>
                       <td>Hình</td>
                <td><input type="file" id="upload"/></td>
                        <td>
      <asp:Label runat="server" ID="lb2">Mã loại</asp:Label>
  </td>
  <td class="auto-style1">
      <asp:TextBox runat="server" ID="tmalooai"></asp:TextBox>
      </td>

  
   
       <td>Thời gia bảo hành</td><td><asp:TextBox runat="server"></asp:TextBox></td>
                  </tr>
                  <tr>
                    
   
                       <td class="auto-style2">Tên sản phẩm</td>
 <td class="auto-style2"><asp:TextBox runat="server" ID="ttensanpham"></asp:TextBox></td>
                        <td class="auto-style2">Đơn Giá</td>
  <td class="auto-style2"><asp:TextBox runat="server" ID="tdongia"></asp:TextBox></td>
                                                            <td class="auto-style2">Quảng Cáo</td>

<td class="auto-style2"><asp:TextBox runat="server" ID="tquangcao"></asp:TextBox></td>
                          <td class="auto-style2">Mã đơn vị sản xuất</td>
                <td class="auto-style2"> <asp:TextBox runat="server" Height="22px" ID="tmadonvisanxuat"></asp:TextBox></td>
                  </tr>
              
                     <tr>
            
                          
                         
               
                                               <td >Mô tả</td>
                <td colspan="7"><asp:TextBox runat="server" ID="tmota" TextMode="MultiLine" Width="100%" ></asp:TextBox></td>
            </tr>
                  <tr>
                     <td colspan="8" align="center">
    <asp:Button runat="server" ID="btnLuu" Text="Lưu" OnClick="btnLuu_Click" style="margin-right:30px;width:50px;height:40px"/>
    <asp:Button runat="server" ID="btnHuy" Text="Hủy" OnClick="btnHuy_Click" style="margin-right:30px;width:50px;height:40px"/>
                         <asp:Button runat="server" ID="btnXoa" Text="Xóa" OnClick="btnXoa_Click" Style="margin-right: 30px;width:50px;height:40px" />
</td>
                  </tr>
                  </table>
          </div>
         

  <div>
              <table border="1">
                       <tr>
            <td>Mã sản phẩm</td>
            <td>Mã loại sản phẩm</td>
            <td>Đơn vị sản xuất</td>
            <td>Tên sản phẩm</td>
            <td>Hình</td>
            <td>Mô tả</td>
            <td>Thời gian bảo hành</td>
            <td>Đơn giá</td>
            <td>Quảng cáo</td>
        </tr>
                       
                           <%
                               if (sanpham != null)
                               {
                                   for(int i =0; i < sanpham.Rows.Count; i++)
                                   {
                                       %>
                  <tr>
            <td><%=sanpham.Rows[i]["masanpham"] %></td>
            <td><%=sanpham.Rows[i]["maloaisanpham"]%></td>
            <td><%=sanpham.Rows[i]["madonvisanxuat"] %></td>
            <td><%=sanpham.Rows[i]["tensanpham"]%></td>
            <td><img src='<%="../anh/"+sanpham.Rows[i]["hinh"]%>' width="100"/></td>
           <td><%=sanpham.Rows[i]["mota"]%></td>
            <td><%=sanpham.Rows[i]["thoigianbaohanh"]%></td>
           <td><%=sanpham.Rows[i]["dongia"]%></td>
            <td><%=sanpham.Rows[i]["quangcao"]%></td>
        </tr>
           <%       } 
                }%>
              </table>
  
      </div>
     </asp:View>
                      <asp:View runat="server" ID="view2">
                          <h2>Danh Mục Đơn Vị Sản Xuất</h2>
                          <table>
                              <tr>
                                  <td>
                                      <asp:Label runat="server" >Mã đơn vị sản xuất</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox runat="server" ID="txtMaDonVi"></asp:TextBox>
                                  </td>
                                  </tr>
                              <tr>
                                  <td>
                                      <asp:Label runat="server" ID="lbTenDonVi">Tên đơn vị sản xuất</asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox runat="server" ID="txtTenDonVi"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2">
                                      <button runat="server" id="btnLuuDonVi">Lưu</button>
                                      <button runat="server" id="btnHuyDonVi">Hủy</button>
                                  </td>
                                  </tr>
                          </table >
                          <table border="1">
                              <tr>
                                  <td>Mã đơn vị sản xuất</td>
                                  <td>Tên đơn vị sản xuất</td>
                              </tr>
                              
                              
                                  <%
                                      if (nhacungcap != null)
                                      {
                                          for (int a = 0; a < nhacungcap.Rows.Count; a++)
                                          { 
                                              %>
                              <tr>
                                  <td><%=nhacungcap.Rows[a]["madonvisanxuat"] %></td>
                                  <td><%=nhacungcap.Rows[a]["tendonvisanxuat"] %></td>
                              </tr>
                                  <% 
                                         }
                                       }
                                      
                                      %>
                              
                              
                          
                             
                          </table>
     </asp:View>
                         <asp:View runat="server" ID="view3">
                             <h2>Danh Mục Tài Khoản</h2>
                                   <table >
                                       <tr>
                                           <td>
                                               <asp:Label runat="server" ID="lb3">Tên tài khoản</asp:Label>
                                           </td>
                                           <td>
                                               <asp:TextBox runat="server" ID="txtTenTaiKhoan"></asp:TextBox>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               <asp:Label runat="server" ID="lb4">Mật khẩu</asp:Label>
                                           </td>
                                           <td>
                                               <asp:TextBox runat="server" ID="txtMatKhau"></asp:TextBox>
                                           </td>
                                           </tr>
                                       <tr
>
                                           <td colspan="2">
                                               <button runat="server" id="btaikhoan">Lưu</button>
                                                 <button runat="server" id="bhuy" onclick="">Hủy</button>
                                           </td>
                                       </tr>                                       </table>
                             <table border="1">
                                 <tr>
                                     <td>Tên tài khoản</td>
                                     <td>Mật khẩu</td>
                                 </tr>
                                 

                                 <%
                                     if (taikhoan != null)
                                     {
                                         for (int c = 0; c < taikhoan.Rows.Count; c++)
                                         { %>
                                 <tr>
                                 <td><%=taikhoan.Rows[c]["tendangnhap"] %></td>
                                 <td><%=taikhoan.Rows[c]["matkhau"] %></td>
                                      </tr> 
                                 <%
                                         }
                                     }%>
                                      
                             </table>
            
     </asp:View>
                    <asp:View runat="server" ID="view4">
                        <h2>Danh Mục Hóa Đơn</h2>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lb5">Mã hóa đơn</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtMaHoaDon"></asp:TextBox>
                                </td>
  
                                                                   <td>
       Tổng tiền
   </td>
   <td>
       <asp:TextBox runat="server" ID="ttongtien"></asp:TextBox>
   </td>
    
                                                                <td>
     <asp:Label runat="server" ID="lb7">Ngày giao hàng</asp:Label>
</td>
<td>
    <asp:TextBox runat="server" ID="tgiaohang" OnTextChanged="tgiaohang_TextChanged" TextMode="Date"></asp:TextBox>
</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lb">Mã khách hàng</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tmakhachhang"></asp:TextBox>
                                </td>
                                   <td>
    <asp:Label runat="server" ID="lb6">Ngày đặt hàng</asp:Label>
</td>
<td >
    <asp:TextBox runat="server" ID="tdathang" Style="width:99%" TextMode="DateTime"></asp:TextBox>
</td>
                  <td>Tổng tiền</td>             
<td>
    <asp:TextBox runat="server" ID="ttien"></asp:TextBox>
</td>
                            </tr>
                            <tr>
                                                                <td>
    <asp:Label runat="server" ID="lb8">Ghi chú</asp:Label>
</td>
<td colspan="5">
    <asp:TextBox runat="server" ID="tghichu" Style="width:99%" TextMode="MultiLine"></asp:TextBox>
</td>
 
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <button runat="server" id="btnLuuHoaDon">Lưu</button>
                                    <button runat="server" id="btnHuyHoaDon">Hủy</button>
                                </td>
                            </tr>   
                        </table>
                        <table border="1">
                            <tr>
                                <td>Mã hóa đơn
                                </td>
                                <td>Mã khách hàng</td>
                                <td>Ngày đặt hàng</td>
                                <td>Ngày giao hàng</td>
                                <td>Tổng tiền</td>
                                <td>Ghi chú</td>
                            </tr>
                           
                                <%
                                    if (hoadon != null)
                                    {
                                        for (int d = 0; d < hoadon.Rows.Count; d++)
                                        { %>
                             <tr>
                                <td><%=hoadon.Rows[d]["mahoadon"] %></td>
                                <td><%=hoadon.Rows[d]["makh"] %></td>
                                <td><%=hoadon.Rows[d]["ngaydathang"] %></td>
                                <td><%=hoadon.Rows[d]["ngaygiaohang"] %></td>
                                 <td><%=hoadon.Rows[d]["tongtien"] %></td>
                                <td><%=hoadon.Rows[d]["ghichu"] %></td>
                                 </tr>
                                <%  
                                        }
                                    }%>
                               
                        </table>
                    </asp:View>
                    <asp:View runat="server" ID="view5">
                                                  <h2>Danh Mục Chi Tiết Hóa Đơn</h2>
                             <div>
     <table>
         <tr>
             <td>Mã loại sản phẩm</td>
             <td><asp:TextBox runat="server" ID="tmaloaisnapham"></asp:TextBox></td>
                 <td>Thành tiền</td>
             <td><asp:TextBox runat="server" ID="tthanhtien"></asp:TextBox></td>
             </tr>
            <tr>
    <td>Mã hoá đơn</td>
                <td>
                    <asp:TextBox runat="server" ID="tmahoadon"></asp:TextBox>
                </td>
                    <td>Đơn giá</td>
                 <td><asp:TextBox runat="server" ID="tdongia1"></asp:TextBox></td>
                </tr>
            
             <tr>
    <td>Số lượng</td>
                 <td><asp:TextBox runat="server" ID="tsoluong"></asp:TextBox></td>
                              <td colspan="2">
                     <asp:Button runat="server" ID="Button1" Text="Lưu" OnClick="btnLuu_Click" />
<asp:Button runat="server" ID="Button2" Text="Hủy" OnClick="btnHuy_Click" />
             </td>
                 </tr>
             
             
      
                 
      
     </table>
                             </div>
                             <div>
                                 <table border="1">
                                     <tr>
                                         <td>Mã loại sản phẩm</td>
                                         <td>Mã hoá đơn</td>
                                         <td>Số lượng</td>
                                         <td>Đơn giá</td>
                                         <td>Thành tiền</td>
                                     </tr>
                                     <%
                                         if (chitiethoadon != null ) {

                                             for (int b = 0; b < chitiethoadon.Rows.Count; b++)
                                             { %>
                                       <tr>
        <td><%=chitiethoadon.Rows[b]["masanpham"] %></td>
        <td><%=chitiethoadon.Rows[b]["mahoadon"] %></td>
        <td><%=chitiethoadon.Rows[b]["soluong"]  %></td>
        <td><%=chitiethoadon.Rows[b]["dongia"]  %></td>
        <td><%=chitiethoadon.Rows[b]["thanhtien"]  %></td>
    </tr>
                                     <%
                                             }
                                         }%>
                                 </table>
                             </div>
                    </asp:View>
                    <asp:View runat="server" ID="view6">
                        <h2>Danh Mục Khách Hàng</h2>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lb9">Mã khách hàng</asp:Label>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="txtMaKhachHang"></asp:TextBox>
                                </td>
                                  <td>
      <asp:Label runat="server" ID="lb10">Tên khách hàng</asp:Label>
  </td>
  <td>
      <asp:TextBox runat="server" ID="txtTenKhachHang"></asp:TextBox>
  </td>
                            </tr>
                            <tr>
                              
                                <td>
                                    <asp:Label runat="server" ID="lb11">Địa chỉ</asp:Label></td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtDiaChi"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lb12">Điện thoại</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtDienThoai"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <button runat="server" id="btnLuuKhachHang">Lưu</button>
                                    <button runat="server" id="btnHuyKhachHang">Hủy</button>
                                </td>
                            </tr>
                        </table>
                        <table border="1">
                            <tr>
                                <td>Mã khách hàng</td>
                            <td>Tên khách hàng</td>
                                <td>Địa chỉ</td>
                                <td>Điện thoại</td>
                            </tr>
                            <% if (khachhang != null)

                                {
                                    for (int n = 0; n < khachhang.Rows.Count; n++)
                                    {

                                    %>
                            <tr>
                                <td><%=khachhang.Rows[n]["makh"] %></td>
                                <td><%=khachhang.Rows[n]["hoten"] %></td>
                                <td><%=khachhang.Rows[n]["diachi"] %></td>
                                <td><%=khachhang.Rows[n]["SDT"] %></td>

                            </tr>
                            <%

                                    }
                                    }%>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
     
            
        <footer>
            <h3>
                Địa chỉ: ABC,ABC,ABC,ABC
                </h3>
            </footer>
              </form>
</body>
</html>