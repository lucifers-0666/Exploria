using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class AdminReviews
    {
        protected global::System.Web.UI.WebControls.Literal litTotalReviews;
        protected global::System.Web.UI.WebControls.Literal litApprovedReviews;
        protected global::System.Web.UI.WebControls.Literal litPendingReviews;
        protected global::System.Web.UI.WebControls.Literal litAvgRating;
        protected global::System.Web.UI.WebControls.DropDownList ddlRatingFilter;
        protected global::System.Web.UI.WebControls.DropDownList ddlStatusFilter;
        protected global::System.Web.UI.WebControls.DropDownList ddlDestinationFilter;
        protected global::System.Web.UI.WebControls.Button btnApplyFilters;
        protected global::System.Web.UI.WebControls.GridView gvReviews;
    }
}
