using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class BlogDetails
    {
        protected global::System.Web.UI.WebControls.Literal litCategoryIcon;
        protected global::System.Web.UI.WebControls.Literal litCategory;
        protected global::System.Web.UI.WebControls.Literal litTitle;
        protected global::System.Web.UI.WebControls.Literal litAuthor;
        protected global::System.Web.UI.WebControls.Literal litPublishedDate;
        protected global::System.Web.UI.WebControls.Literal litViewCount;
        protected global::System.Web.UI.WebControls.Literal litReadTime;
        protected global::System.Web.UI.WebControls.Image imgFeatured;
        protected global::System.Web.UI.WebControls.Literal litContent;
        protected global::System.Web.UI.WebControls.Repeater rptTags;
        protected global::System.Web.UI.WebControls.Literal litAuthorName;
        protected global::System.Web.UI.WebControls.Literal litAuthorName2;
        protected global::System.Web.UI.WebControls.Literal litCommentCount;
        protected global::System.Web.UI.WebControls.TextBox txtCommentName;
        protected global::System.Web.UI.WebControls.TextBox txtCommentEmail;
        protected global::System.Web.UI.WebControls.TextBox txtCommentText;
        protected global::System.Web.UI.WebControls.Button btnSubmitComment;
        protected global::System.Web.UI.WebControls.Repeater rptComments;
        protected global::System.Web.UI.WebControls.HyperLink lnkShareFacebook;
        protected global::System.Web.UI.WebControls.HyperLink lnkShareTwitter;
        protected global::System.Web.UI.WebControls.HyperLink lnkShareLinkedIn;
        protected global::System.Web.UI.WebControls.HyperLink lnkShareWhatsApp;
        protected global::System.Web.UI.WebControls.Repeater rptRelatedPosts;
        protected global::System.Web.UI.WebControls.TextBox txtNewsletterEmail;
        protected global::System.Web.UI.WebControls.Button btnSubscribe;
    }
}
