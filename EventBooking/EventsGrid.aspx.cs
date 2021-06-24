using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBooking
{
    public partial class EventsGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
           if( e.Column.FieldName == "Date")
            {
                e.Value = ((DateTime)e.GetListSourceFieldValue("Data")).ToString("dd.MM.yyyy", CultureInfo.InvariantCulture);
            }
            if (e.Column.FieldName == "Time")
            {
                e.Value = ((DateTime)e.GetListSourceFieldValue("Data")).ToString("HH:mm", CultureInfo.InvariantCulture);
            }
            if (e.Column.FieldName == "Number")
            {
                e.Value = e.ListSourceRowIndex + 1;
            }
        }

        protected void dsEvents_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "EventId";
            e.DefaultSorting = "Data DESC";
            //e.QueryableSource = ((IQueryable<Events>)e.QueryableSource).OrderByDescending(x => x.Data);
        }

        protected void dsLocations_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "LocationId";
            e.DefaultSorting = "Name ASC";
            //e.QueryableSource = ((IQueryable<Events>)e.QueryableSource).OrderByDescending(x => x.Data);
        }
    }
}