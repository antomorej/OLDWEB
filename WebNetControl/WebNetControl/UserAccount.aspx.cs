using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNetControl
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OkBtn_Click(object sender, EventArgs e)
        {
            DataSourceSelectArguments pArguments = new DataSourceSelectArguments();
            SqlDominio.Select(pArguments);
            DomainList.DataBind();
        }

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewUsers.Visible = false;
            UserDetailsView.Visible = true;
            Cerrar.Visible = true;
            Servicios.Visible = true;
        }

        protected void Cerrar_Click(object sender, EventArgs e)
        {
            GridViewUsers.Visible = true;
            UserDetailsView.Visible = false;
            Cerrar.Visible = false;
            Servicios.Visible = false;
            GridServicios.Visible = false;
            GridViewUsers.DataBind();
        }

        protected void GroupList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //
        }

        protected void UserDetailsView_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            EventArgs ne = new EventArgs();
            Cerrar_Click(sender, ne);
        }

        protected void UserDetailsView_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            EventArgs ne = new EventArgs();
            Cerrar_Click(sender, ne);
        }

        protected void UserDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            EventArgs ne = new EventArgs();
            Cerrar_Click(sender, ne);
        }

        protected void Servicios_Click(object sender, EventArgs e)
        {
            if (!GridServicios.Visible)
            {
                GridServicios.Visible = true;
                GridServicios.DataBind();
                if (GridServicios.Rows.Count < 1)
                {
                    SqlServicios.Insert();
                }
            }
            else SqlServicios.Insert(); // nuevo servicio
        }

   
        protected void GridServicios_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        
    }
}