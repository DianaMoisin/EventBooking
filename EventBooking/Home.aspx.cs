using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBooking
{
    public partial class _Default : Page
    {
        CulturalHouseEntities entity = new CulturalHouseEntities();

        public string Path { get; set; } = "https://localhost:44371/";

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void dsEvents_QueryCreated(object sender, QueryCreatedEventArgs e)
        {
            e.Query = ((IQueryable<Events>)e.Query).Where(x => x.Approved).OrderByDescending(x => x.Data).Take(6);
        }

        protected void eventCardView_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxCardViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "Image")
            {
                e.Value = Path + e.GetListSourceFieldValue("Photo");
            }
        }

        protected void btnGoEvents_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Event.aspx");
        }
    }
}