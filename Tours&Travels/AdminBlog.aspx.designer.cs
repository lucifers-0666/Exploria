using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class AdminBlog
    {
        protected global::System.Web.UI.WebControls.TextBox txtSearch;
        protected global::System.Web.UI.WebControls.Button btnSearch;
        protected global::System.Web.UI.WebControls.Button btnAddNew;
        protected global::System.Web.UI.WebControls.Literal litTotalPosts;
        protected global::System.Web.UI.WebControls.Literal litPublishedPosts;
        protected global::System.Web.UI.WebControls.Literal litTotalViews;
        protected global::System.Web.UI.WebControls.Literal litCategories;
        protected global::System.Web.UI.WebControls.GridView gvBlogPosts;
        protected global::System.Web.UI.WebControls.Literal litModalTitle;
        protected global::System.Web.UI.WebControls.HiddenField hdnBlogId;
        protected global::System.Web.UI.WebControls.TextBox txtTitle;
        protected global::System.Web.UI.WebControls.DropDownList ddlCategory;
        protected global::System.Web.UI.WebControls.TextBox txtAuthor;
        protected global::System.Web.UI.WebControls.TextBox txtImageUrl;
        protected global::System.Web.UI.WebControls.TextBox txtExcerpt;
        protected global::System.Web.UI.WebControls.TextBox txtContent;
        protected global::System.Web.UI.WebControls.TextBox txtTags;
        protected global::System.Web.UI.WebControls.CheckBox chkFeatured;
        protected global::System.Web.UI.WebControls.CheckBox chkPublished;
        protected global::System.Web.UI.WebControls.Button btnSave;
    }
}
