<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="BaiTap.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <style>
    .row {
      display: flex;
    }

    .item {
      padding: 10px;
      background-color: lightblue;
      margin: 5px;
      border: 1px solid #ccc;
    }
  </style>
    <title></title>
</head>
<body onload="xoay();">
    <form id="form1" runat="server">
  <div>
    <script language="javascript" type="text/javascript">
        var biendem = 0;
        var masanpham = 0;
        var hinh = 0;
        var manghinh = new Array();
        var mangid = new Array();
        var timeout;

        <% for (int i = 0; i < quangcao.Rows.Count; i++) { %>
        mangid[<%= i %>] = "<%= quangcao.Rows[i]["masanpham"] %>";
            manghinh[<%= i %>] = "<%= quangcao.Rows[i]["hinh"] %>";
        <% } %>

        function xoay() {
            if (biendem >= manghinh.length) biendem = 0;
            masanpham = biendem;
            hinh = biendem;
            document.khunghinhngang.src = "../anh/" + manghinh[hinh];
            timeout = setTimeout(xoay, 3000);
            biendem++;
        }

        function dunghinhlai() {
            clearTimeout(timeout);
        }

        function doihinhkhac() {
            clearTimeout(timeout);
            xoay();
        }

        function trangchitiet() {
            window.location = "WebForm9.aspx?masanpham=" + mangid[masanpham];
        }
    </script>

    <img src="" name="khunghinhngang"
         style="cursor: pointer; text-align: center; z-index: 1;width:auto;height:"
         onclick="trangchitiet();"
         onmouseover="dunghinhlai();"
         onmouseout="doihinhkhac();" />
</div>


    </form>
</body>
</html>
