<%@ Page Title="Booking Reports" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookingReports.aspx.cs" Inherits="Tours_Travels.AdminBookingReports" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .reports-container {
            max-width: 1400px;
            margin: 120px auto 60px;
            padding: 0 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .page-header h1 {
            font-size: 36px;
            font-weight: 700;
            color: #164426;
            margin-bottom: 12px;
        }

        .report-controls {
            background: white;
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .control-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .control-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .control-label {
            font-weight: 600;
            color: #164426;
            font-size: 14px;
        }

        .control-input {
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .control-input:focus {
            outline: none;
            border-color: #c9a877;
            box-shadow: 0 0 0 3px rgba(201, 168, 119, 0.1);
        }

        .btn-report {
            background: linear-gradient(135deg, #164426 0%, #0b6e4f 100%);
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-report:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(22, 68, 38, 0.3);
        }

        .btn-export {
            background: linear-gradient(135deg, #c9a877 0%, #a88959 100%);
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-left: 10px;
        }

        .btn-export:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(201, 168, 119, 0.3);
        }

        .button-group {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .report-viewer-container {
            background: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            min-height: 600px;
        }

        .alert {
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert-info {
            background: #cfe2ff;
            color: #084298;
            border: 1px solid #084298;
        }

        .alert-error {
            background: #f8d7da;
            color: #842029;
            border: 1px solid #842029;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="reports-container">
        <div class="page-header">
            <h1>
                <i class="las la-file-alt" style="color: #c9a877;"></i>
                Booking Reports
            </h1>
            <p>Generate and export booking reports</p>
        </div>

        <!-- Alert Messages -->
        <asp:Panel ID="pnlInfo" runat="server" Visible="false" CssClass="alert alert-info">
            <i class="las la-info-circle" style="font-size: 24px;"></i>
            <asp:Label ID="lblInfo" runat="server"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-error">
            <i class="las la-exclamation-circle" style="font-size: 24px;"></i>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </asp:Panel>

        <!-- Report Controls -->
        <div class="report-controls">
            <div class="control-grid">
                <div class="control-group">
                    <label class="control-label">Report Type</label>
                    <asp:DropDownList ID="ddlReportType" runat="server" CssClass="control-input" AutoPostBack="false">
                        <asp:ListItem Value="BookingSummary" Text="Booking Summary Report"></asp:ListItem>
                        <asp:ListItem Value="Revenue" Text="Revenue Analysis Report"></asp:ListItem>
                        <asp:ListItem Value="CustomerBookings" Text="Customer Bookings Report"></asp:ListItem>
                        <asp:ListItem Value="DestinationWise" Text="Destination-wise Report"></asp:ListItem>
                        <asp:ListItem Value="DateRange" Text="Date Range Report"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="control-group">
                    <label class="control-label">Status Filter</label>
                    <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="control-input">
                        <asp:ListItem Value="All" Text="All Statuses"></asp:ListItem>
                        <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                        <asp:ListItem Value="Confirmed" Text="Confirmed"></asp:ListItem>
                        <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                        <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="control-group">
                    <label class="control-label">From Date</label>
                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="control-input" TextMode="Date"></asp:TextBox>
                </div>

                <div class="control-group">
                    <label class="control-label">To Date</label>
                    <asp:TextBox ID="txtToDate" runat="server" CssClass="control-input" TextMode="Date"></asp:TextBox>
                </div>
            </div>

            <div class="button-group">
                <asp:Button ID="btnGenerateReport" runat="server" CssClass="btn-report" Text="Generate Report" OnClick="btnGenerateReport_Click" />
                <asp:Button ID="btnExportPDF" runat="server" CssClass="btn-export" Text="Export to PDF" OnClick="btnExportPDF_Click" />
                <asp:Button ID="btnExportExcel" runat="server" CssClass="btn-export" Text="Export to Excel" OnClick="btnExportExcel_Click" />
            </div>
        </div>

        <!-- Crystal Reports Viewer -->
        <div class="report-viewer-container">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                AutoDataBind="true" 
                EnableDatabaseLogonPrompt="False"
                EnableParameterPrompt="False"
                HasCrystalLogo="False"
                HasToggleGroupTreeButton="False"
                ToolPanelView="None"
                Width="100%"
                Height="800px" />
        </div>
    </div>
</asp:Content>
