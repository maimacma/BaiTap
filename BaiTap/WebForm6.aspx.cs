using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTap
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                viewthunhat.ActiveViewIndex = 0;
            }    
        }

        protected void doi(object sender, EventArgs e)
        {
           LinkButton button = (LinkButton)sender;
            int trang = Convert.ToInt32(button.CommandArgument);
            viewthunhat.ActiveViewIndex = trang;
        }
    }
}