using System.Net;
using System.Net.Mail;

namespace BLL.Services
{
    public class EmailService
    {
        private readonly string smtpHost = "smtp.gmail.com";  // Your SMTP server (e.g., Gmail)
        private readonly int smtpPort = 587;  // SMTP port (587 is for TLS, 465 is for SSL)
        private readonly string smtpUser = "shadmansakibalam@gmail.com";  // Your email address
        private readonly string smtpPassword = "wwix yeqd qadu kisi";  // Your email password

        // Method to send email
        public void SendEmail(string toEmail, string subject, string body)
        {
            var fromAddress = new MailAddress(smtpUser, "Your Hotel Name or System");
            var toAddress = new MailAddress(toEmail);
            var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true  // Set to true if the email body contains HTML
            };

            using (var smtpClient = new SmtpClient(smtpHost, smtpPort))
            {
                smtpClient.Credentials = new NetworkCredential(smtpUser, smtpPassword);
                smtpClient.EnableSsl = true;  // Enable SSL for secure connection
                smtpClient.Send(message);
            }
        }
    }
}