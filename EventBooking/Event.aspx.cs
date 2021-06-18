using DevExpress.Web;
using EventBooking.Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBooking
{
    public partial class Event : System.Web.UI.Page
    {
        public string LocalPath { get; set; } = "https://localhost:44371/";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (LoginServices.UserId != 0)
            {
                usersEventCardView.ClientVisible = true;
                clientsEventCardView.ClientVisible = false;
            }

            if (LoginServices.ClientId != 0 || (LoginServices.UserId == 0 && LoginServices.ClientId == 0))
            {
                usersEventCardView.ClientVisible = false;
                clientsEventCardView.ClientVisible = true;
            }
        }

        protected void dsEvents_QueryCreated(object sender, QueryCreatedEventArgs e)
        {
            e.Query = ((IQueryable<Events>)e.Query).Where(x => x.Approved).OrderByDescending(x => x.Data);
        }
        protected void eventCardView_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxCardViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "Image")
            {
                string path = LocalPath + e.GetListSourceFieldValue("Photo").ToString();

                //using (WebClient webClient = new WebClient())
                //{
                //    e.Value = webClient.DownloadData(path);
                //}

                e.Value = path;
            }

            if (e.Column.FieldName == "BookEvent")
            {
                e.Value = "BOOK";
            }
        }

        public string GetLocationById(int locationId)
        {
            using (CulturalHouseEntities dbContext = new CulturalHouseEntities())
            {
                return dbContext.Locations.FirstOrDefault(x => x.LocationId == locationId).Name;
            }
        }

        public byte[] GetImageByEventId(int eventId)
        {
            using (CulturalHouseEntities dbContext = new CulturalHouseEntities())
            {
                Events currentEvent = dbContext.Events.FirstOrDefault(x => x.EventId == eventId);
                if (currentEvent != null)
                {
                    var webClient = new WebClient();
                    return webClient.DownloadData(LocalPath + currentEvent.Photo);
                }
            }
            return null;
        }

        protected void btnBookEvents_Click(object sender, EventArgs e)
        {
            if (LoginServices.ClientId == 0)
            {
                ASPxPopupControl popup = Master.FindControl("popupLogin") as ASPxPopupControl;
                if (popup != null)
                {
                    popup.ShowOnPageLoad = true;
                }
            }
            else
            {
                ASPxButton button = (ASPxButton)sender;
                CardViewCardTemplateContainer container = (CardViewCardTemplateContainer)button.NamingContainer;

                int eventId = Convert.ToInt32(container.KeyValue);

                using (CulturalHouseEntities dbContext = new CulturalHouseEntities())
                {
                    Events bookedEvent = dbContext.Events.FirstOrDefault(x => x.EventId == eventId);
                    if (bookedEvent != null)
                    {
                        Clients client = dbContext.Clients.FirstOrDefault(x => x.ClientId == LoginServices.ClientId);
                        if (client != null)
                        {
                            client.Events.Add(bookedEvent);
                            dbContext.SaveChanges();
                        }
                    }

                }
            }
        }

        protected void usersEventCardView_ToolbarItemClick(object source, ASPxCardViewToolbarItemClickEventArgs e)
        {
            var x = 0;
        }

        protected void usersEventCardView_CustomButtonCallback(object sender, ASPxCardViewCustomButtonCallbackEventArgs e)
        {
            var x = 0;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            usersEventCardView.CancelEdit();
        }
    }
}