﻿using DevExpress.Web;
using EventBooking.Services;
using System;
using System.Collections.Generic;
using System.Globalization;
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

        public int EventId { get; set; }


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

            if (e.Column.FieldName == "Date")
            {
                e.Value = ((DateTime)e.GetListSourceFieldValue("Data")).ToString("dd.MM.yyyy", CultureInfo.InvariantCulture);
            }

            if (e.Column.FieldName == "Time")
            {
                e.Value = ((DateTime)e.GetListSourceFieldValue("Data")).ToString("HH:mm", CultureInfo.InvariantCulture);
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

        public string GetDate(DateTime fullDate)
        {
            return fullDate.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture);
        }

        public string GetTime(DateTime fullDate)
        {
            return fullDate.ToString("HH:mm", CultureInfo.InvariantCulture);
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
            int eventId = Convert.ToInt32(Session["eventId"]);

            using (CulturalHouseEntities dbContext = new CulturalHouseEntities())
            {
                Events currentEvent = dbContext.Events.FirstOrDefault(x => x.EventId == eventId);
                if (currentEvent != null)
                {
                    ASPxFormLayout formLayout = usersEventCardView.FindEditFormTemplateControl("editFormUser") as ASPxFormLayout;
                    ASPxTextBox nameTextBox = formLayout.FindNestedControlByFieldName("Name") as ASPxTextBox;
                    ASPxComboBox locationComboBox = formLayout.FindNestedControlByFieldName("Location") as ASPxComboBox;
                    ASPxDateEdit dateEdit = formLayout.FindNestedControlByFieldName("Date") as ASPxDateEdit;
                    ASPxTimeEdit timeEdit = formLayout.FindNestedControlByFieldName("Time") as ASPxTimeEdit;
                    ASPxSpinEdit priceEdit = formLayout.FindNestedControlByFieldName("Price") as ASPxSpinEdit;
                    ASPxSpinEdit placesEdit = formLayout.FindNestedControlByFieldName("AvailablePlaces") as ASPxSpinEdit;


                    currentEvent.Name = nameTextBox.Text;
                    currentEvent.LocationId = Convert.ToInt32(locationComboBox.Value);
                    DateTime date = Convert.ToDateTime(dateEdit.Value);
                    DateTime time = (DateTime)timeEdit.Value;
                    currentEvent.Data = new DateTime(date.Year, date.Month, date.Day, time.Hour, time.Minute, time.Second);
                    currentEvent.Price = Convert.ToDecimal(priceEdit.Value);
                    currentEvent.AvailablePlaces = Convert.ToInt32(placesEdit.Value);

                    dbContext.Entry(currentEvent).State = System.Data.Entity.EntityState.Modified;
                    dbContext.SaveChanges();

                    usersEventCardView.CancelEdit();
                    usersEventCardView.DataBind();
                }
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            usersEventCardView.CancelEdit();
        }

        protected void usersEventCardView_StartCardEditing(object sender, ASPxStartCardEditingEventArgs e)
        {
            Session["eventId"] = Convert.ToInt32(e.EditingKeyValue);
        }

        protected void newButton_Click(object sender, EventArgs e)
        {
            newEventPopup.ShowOnPageLoad = true;
        }
    }
}