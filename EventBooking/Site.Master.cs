using DevExpress.Web;
using EventBooking.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBooking
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUserOK_Click(object sender, EventArgs e)
        {
            string userEmail = tbUserEmail.Text;
            string userPass = tbUserPassword.Text;

            if (String.IsNullOrEmpty(userEmail) || String.IsNullOrEmpty(userPass))
            {
                return;
            }


            if (ASPxEdit.AreEditorsValid(formLayoutUtilizator, "entryGroup"))
            {
                using (CulturalHouseEntities dbContext = new CulturalHouseEntities())
                {
                    if (dbContext.Users.Any(x => x.Email == userEmail))
                    {
                        LoginServices.UserId = dbContext.Users.FirstOrDefault(x => x.Email == userEmail).UserId;
                        lblUser.Text = userEmail;
                        lblUser.ClientVisible = true;
                        popupLogin.ShowOnPageLoad = false;
                    }
                    else
                    {
                        Response.Redirect("~/Register.aspx?ID=1");
                    }
                }
            }
        }

        protected void buttonClientOK_Click(object sender, EventArgs e)
        {
            string clientUsername = tbClientUsername.Text;
            string clientPass = tbClientPassword.Text;

            if (String.IsNullOrEmpty(clientUsername) || String.IsNullOrEmpty(clientPass))
            {
                return;
            }


            if (ASPxEdit.AreEditorsValid(formLayoutClient, "entryGroup"))
            {
                using (CulturalHouseEntities dbContext = new CulturalHouseEntities())
                {
                    Clients client = dbContext.Clients.FirstOrDefault(x => x.Username == clientUsername);
                    if (client != null)
                    {
                        LoginServices.ClientId = client.ClientId;
                        lblUser.Text = clientUsername;
                        lblUser.ClientVisible = true;
                        popupLogin.ShowOnPageLoad = false;
                    }
                    else
                    {
                        Response.Redirect("~/Register.aspx?ID=2");
                    }
                }
            }
        }
    }
}