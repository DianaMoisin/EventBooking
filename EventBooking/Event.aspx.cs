using EventBooking.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBooking
{
    public partial class Event : System.Web.UI.Page
    {
        public string Path { get; set; } = "https://localhost:44371/";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginServices.UserId != 0)
            {
                usersEventCardView.ClientVisible = true;
                clientsEventCardView.ClientVisible = false;
            }

            if (LoginServices.ClientId != 0)
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
                e.Value = Path + e.GetListSourceFieldValue("Photo");
            }

            if (e.Column.FieldName == "BookEvent")
            {
                e.Value = "BOOK";
            }
        }

        public string GetLocationById(int locationId) 
        {
            //de tratat
            return "parc";
        }

    }
}