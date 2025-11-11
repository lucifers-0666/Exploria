using System;

namespace Tours_Travels.Models
{
    /// <summary>
    /// Model class for Crystal Report - Booking Invoice
    /// Contains all data fields needed for the invoice report
    /// </summary>
    public class BookingInvoiceModel
    {
        // Booking Information
        public int BookingId { get; set; }
        public DateTime BookingDate { get; set; }
        public string BookingStatus { get; set; }

        // Customer Information
        public string TravelerFirstName { get; set; }
        public string TravelerLastName { get; set; }
        public string TravelerEmail { get; set; }
        public string TravelerPhone { get; set; }
        public DateTime TravelDate { get; set; }

        // Destination Information
        public string DestinationName { get; set; }
        public string Duration { get; set; }
        public decimal PricePerPerson { get; set; }

        // Travelers Count
        public int NumberOfAdults { get; set; }
        public int NumberOfChildren { get; set; }

        // Payment Information
        public decimal TotalAmount { get; set; }
        public decimal TaxAmount => TotalAmount * 0.18m; // GST 18%
        public decimal GrandTotal => TotalAmount + TaxAmount;
        public string PaymentStatus { get; set; }
        public string PaymentMethod { get; set; }

        // Calculated Fields
        public decimal AdultTotal => NumberOfAdults * PricePerPerson;
        public decimal ChildrenTotal => NumberOfChildren * (PricePerPerson / 2);
        public int TotalTravelers => NumberOfAdults + NumberOfChildren;
        public string FullCustomerName => $"{TravelerFirstName} {TravelerLastName}";

        // Invoice Metadata
        public DateTime InvoiceGeneratedDate { get; set; }
        public string InvoiceNumber => $"EXP-{BookingId:D6}";

        // Constructor
        public BookingInvoiceModel()
        {
            InvoiceGeneratedDate = DateTime.Now;
            PaymentStatus = "Pending";
            PaymentMethod = "Not Specified";
            BookingStatus = "Confirmed";
        }
    }
}
