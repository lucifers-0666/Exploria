using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
	public partial class Home : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Initialize default values if needed
			}
		}

		/// <summary>
		/// Handles the hero search button click event
		/// Redirects to Destination.aspx with search parameters
		/// </summary>
		protected void btnHeroSearch_Click(object sender, EventArgs e)
		{
			try
			{
				// Get search parameters
				string destination = txtDestination.Text.Trim();
				string date = txtDate.Text.Trim();
				string travelers = txtTravelers.Text.Trim();

				// Build query string
				var queryParams = new List<string>();

				if (!string.IsNullOrEmpty(destination))
				{
					queryParams.Add($"destination={HttpUtility.UrlEncode(destination)}");
				}

				if (!string.IsNullOrEmpty(date))
				{
					queryParams.Add($"date={HttpUtility.UrlEncode(date)}");
				}

				if (!string.IsNullOrEmpty(travelers))
				{
					queryParams.Add($"travelers={HttpUtility.UrlEncode(travelers)}");
				}

				// Add search flag
				queryParams.Add("search=true");

				// Build URL
				string url = "Destination.aspx";
				if (queryParams.Count > 0)
				{
					url += "?" + string.Join("&", queryParams);
				}

				// Redirect to destination page with search parameters
				Response.Redirect(url, false);
				Context.ApplicationInstance.CompleteRequest();
			}
			catch (Exception ex)
			{
				// Log error (you can add logging here)
				System.Diagnostics.Debug.WriteLine($"Search error: {ex.Message}");
				
				// Redirect to destination page without parameters as fallback
				Response.Redirect("Destination.aspx", false);
				Context.ApplicationInstance.CompleteRequest();
			}
		}
	}
}