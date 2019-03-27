using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNetControl
{
    public partial class Envios : System.Web.UI.Page
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

        protected void PERIODO_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime hoy = DateTime.Today;
            DateTime ayer = DateTime.Today.AddDays(-1);
            DateTime mannana = DateTime.Today.AddDays(1);
            DateTime iniciomes = new DateTime(hoy.Year, hoy.Month, 1);
            DateTime mespasado = PastMonth();
            DateTime anterior = mespasado.AddDays(-365);

            if (PERIODO.Text == "0")
            {
                Desde.Text = hoy.ToString();
                Hasta.Text = mannana.ToString();
            }

            if (PERIODO.Text == "1")
            {
                Desde.Text = ayer.ToString();
                Hasta.Text = hoy.ToString();
            }

            if (PERIODO.Text == "2")
            {
                Desde.Text = iniciomes.ToString();
                Hasta.Text = mannana.ToString();
            }

            if (PERIODO.Text == "3")
            {
                Desde.Text = mespasado.ToString();
                Hasta.Text = iniciomes.ToString();
            }

            if (PERIODO.Text == "4")
            {
                Desde.Text = anterior.ToString();
                Hasta.Text = mespasado.ToString();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlTrans.Delete();
        }

        protected void OkBtn_Click(object sender, EventArgs e)
        {
            DataSourceSelectArguments pArguments = new DataSourceSelectArguments();
            SqlDominio.Select(pArguments);
            SqlGrupo.Select(pArguments);
            DeleteBtn.Visible = (SuperID.Text == "medlinknet");
            DomainList.DataBind();
            GroupList.DataBind();
        }     

        protected void BEnvios_Click(object sender, EventArgs e)
        {

           
        }

        protected void BEstad_Click(object sender, EventArgs e)
        {
            
        }


        protected void DomainList_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlGrupo.DataBind();
        }

        protected void GroupList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GroupText.Text = GroupList.SelectedItem.ToString();
            UserList.DataBind();
        }

        protected void UserList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DSCount2.DataBind();
            SqlTrans.DataBind();
        }

        protected void Desde_TextChanged(object sender, EventArgs e)
        {

        }

   
        
  
    }
}