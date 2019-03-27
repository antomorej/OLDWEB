using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNetControl
{
    public partial class Description : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView.ActiveViewIndex--;
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            MultiView.ActiveViewIndex++;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // store data into database
        }

        protected override void OnPreRender(EventArgs e)
        {
            if (MultiView.ActiveViewIndex == MultiView.Views.Count - 1)
            {
                //
            }

            btnBack.Visible = MultiView.ActiveViewIndex > 0;
            btnNext.Visible = MultiView.ActiveViewIndex < MultiView.Views.Count - 1;
        //    btnSend.Visible = MultiView.ActiveViewIndex == MultiView.Views.Count - 1;
            base.OnPreRender(e);
        }
    }
}