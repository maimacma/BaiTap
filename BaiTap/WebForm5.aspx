<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="BaiTap.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
   
    <asp:Table runat="server" style="width:auto; background-color:aliceblue; margin-bottom: 2px;">
        <asp:TableRow>
            <asp:TableCell Width="850" Enabled="false">
                            <a href="WebForm1.aspx"  style="text-decoration: none; color:black; font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif; font-size: xx-large; font-weight:bold" Width="20" > Trang chủ</a>
                        </asp:TableCell>
            <asp:TableCell Style="width:200px">
                            <a style="font-weight:bold;font-family:'Times New Roman', Times, serif;font-size:larger">Thông tin tài khoản</a>
                        </asp:TableCell>
            <asp:TableCell Width="200" Height="50" Font-Bold="true" Font-Names="Times New Roman" Style="color:black">  
                            <asp:Menu runat="server" ID="Menu1" Orientation="Horizontal" StaticEnableDefaultPopOutImage="false" StaticMenuItemStyle-ForeColor="Black" DynamicHoverStyle-Font-Bold="true" Style="font-size:larger; font-family:'Times New Roman', Times, serif; background-color:aliceblue;" BorderColor="Wheat" DynamicHoverStyle-ForeColor="AliceBlue">
                                <Items >
                                    
                                    <asp:MenuItem Text="Các loại dịch vụ" >
                                        <asp:MenuItem Text="Các loại tài khoản" ></asp:MenuItem>
                                        <asp:MenuItem Text="Vật phẩm trong game"></asp:MenuItem>
                                        <asp:MenuItem Text="Cày thuê"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>
                        </asp:TableCell>
            <asp:TableCell runat="server" Width="200">
                            <a href="WebForm2.aspx" style="text-decoration: none;  font-family:'Times New Roman', Times, serif;font-size: large; color:black; font-weight:bold ">Lịch sử mua hàng</a>
                        </asp:TableCell>
            <asp:TableCell Width="150">
                            <a href="WebForm3.aspx" style="text-decoration:none;  font-family:'Times New Roman', Times, serif;font-size: larger; color:black ; font-weight:bold ">
                                Nạp tiền
                            </a>

                        </asp:TableCell>
            <asp:TableCell Width="160">
                            <a href="WebForm4.aspx" style="text-decoration:none;  font-family:'Times New Roman', Times, serif;font-size: larger; color:black ; font-weight:bold " > Đăng nhập</a>
                        </asp:TableCell>
            <asp:TableCell Width="120"><a href="WebForm5.aspx" style="text-decoration:none; color:black; font-family:'Times New Roman', Times, serif; font-size:larger; font-weight:bold" > Đăng Ký</a> </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
    <div style="background-image:url('file:///d:/asp/baitap/baitap/anh/anh2.jpg'); background-size:cover; height: 1080px;width:1920;">
   
        <div style="place-items:center;place-content:center;display:block; width:100%; text-align:center;" >
         
            <a style="font-size:xx-large;font-family:Cambria, Cochin, Georgia, Times, Times New Roman, serif;font-weight:bold;width:100%;">ĐĂNG KÝ</a>
           
          
        </div>
        <div>

        </div>
        <div>

        </div>
    </div>
        
</asp:Content>


