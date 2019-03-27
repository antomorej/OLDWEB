using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNetControl
{
    public partial class admin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
      
        }

        DateTime PastMonth()
        {
            DateTime hoy = DateTime.Today;
            int year = hoy.Year;
            int month = hoy.Month;
            if (month > 1) month = month - 1;
            else
            {
                month = 12;
                year = year - 1;
            }
            return new DateTime(year, month, 1);
        }

        protected void EntrarBtn_Click1(object sender, EventArgs e)
        {
            if (ClaveTx.Text == "Mianalay1")
            {
                borrartrans.Enabled  = true;
                ocultartrans.Enabled = true;
                EntrarBD.Enabled = true;

                DateTime mespasado = PastMonth();

                DateTB.Text = mespasado.ToString();
            }
        }

        protected void EntrarBD_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://p3nmssqladmin.secureserver.net/6/scripts/2005/login.aspx?uniqueDnsEntry=medlinknet.db.5747711.hostedresource.com");
        }

        protected void ocultartrans_Click(object sender, EventArgs e)
        {
            SqlTrans.Update();
        }

        protected void borrartrans_Click(object sender, EventArgs e)
        {
            SqlTrans.Delete();
        }

    }
   
}