using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBooking
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //1 = utilizator;
            //2 = client;
            int userType = Convert.ToInt32(Request.QueryString["ID"]);

            if (userType == 1)
            {
                formLayoutClienti.ClientVisible = false;
            }

            if (userType == 2)
            {
                formLayoutUtilizatori.ClientVisible = false;
            }
        }

        protected void buttonSaveU_Click(object sender, EventArgs e)
        {

        }

        protected void buttonSaveC_Click(object sender, EventArgs e)
        {

        }
    }
}