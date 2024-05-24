package mailer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.commons.mail.HtmlEmail;

public class CustomerWeeklyMailer {

    public static void main(String[] args) {
        CustomerWeeklyMailer mailer = new CustomerWeeklyMailer();
        mailer.sendWeeklyEmail();
    }

    private void sendWeeklyEmail() {
        try {
            HtmlEmail email = new HtmlEmail();
            MailerMaster mailerMaster = new MailerMaster();
            mailerMaster.setHtmlEmail(email);
            mailerMaster.setSubject("Weekly Customer Connect Summary");
            mailerMaster.setToList("ashu.dua@mindacorporation.com");
            mailerMaster.setCcList("ashu.dua@mindacorporation.com");

            // Include table data in the email body
            mailerMaster.setFullMailContent(getTableData());

            // Set the MailerMaster instance in the EcrnMailer
            new EcrnMailer().sendCommonEcrnHtmlMail(mailerMaster);

            System.out.println("Weekly email sent successfully!");

        } catch (Exception ex) {
            System.out.println("Error sending weekly email: " + ex.toString());
        }
    }

    private static String getTableData() {
        StringBuilder returnStr = new StringBuilder();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        int meetingCount = 0;

        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "Anand");

            // Execute SQL query to fetch data from the customer_connect_actual table
            String query = "SELECT * FROM customer_connect_actual ORDER BY date DESC";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            // Process the result set and append data to the StringBuilder
            while (rs.next()) {
                meetingCount++; // Increment the counter for each meeting

              
                String customerName = rs.getString("Customer_Name");
                String date = rs.getString("date");
                String place = rs.getString("place");
                String meetObj = rs.getString("meetObj");
                String custPart = rs.getString("custPart");
         /*       String mode = rs.getString("mode");*/
                String mindaPart = rs.getString("mindaPart");

                returnStr.append("<tr>")
                		.append("<td>").append(customerName).append("</td>")  
                        .append("<td>").append(date).append("</td>")
                        .append("<td>").append(place).append("</td>")
                        .append("<td>").append(meetObj).append("</td>")
                        .append("<td>").append(custPart).append("</td>")
                     /*   .append("<td>").append(mode).append("</td>")*/
                        .append("<td>").append(mindaPart).append("</td>")
                        .append("</tr>");
            }
            String greetingMessage = "Hello Sir,<br>"
                    + "<br>"
                    + "Total no. of Customer Connect meetings conducted at are: " + meetingCount + ". "
                    + "<br>"
                    + " The summary of the meeting details is mentioned below:<br>"
                    + "<br>";

            returnStr.insert(0, "<html>"
                    + "<head>"
                    + "<style>"
                    + "table {"
                    + "width: 70%;"
                    + "border-collapse: collapse;"
                    + "margin-top: 20px;"
                    + "}"
                    + "th, td {"
                    + "padding: 5px;"
                    + "text-align: left;"
                    + "border: 1px solid #ddd;"
                    + "}"
                    + "th {"
                    + "background-color: #f2f2f2;"
                    + "font-weight: bold;"
                    + "}"
                    + "tr:hover {"
                    + "background-color: #f5f5f5;"
                    + "}"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<p>" + greetingMessage + "</p>"
                    + "<table>"
                    + "<tr>"
                    + "<th>Customer Name</th>"  
                    + "<th>Date</th>"
                    + "<th>Place</th>"
                    + "<th>Meeting Objective</th>"
                    + "<th>Customer Participants</th>"
                   /* + "<th>Mode</th>" */
                    + "<th>Minda Participants</th>"
                    + "</tr>");

            returnStr.append("</table>")
                    .append("<p>Total Meetings: ").append(meetingCount).append("</p>")
                    .append("</body>")
                    .append("</html>");

        } catch (Exception ex) {
            System.out.println("Error fetching data from the database: " + ex.toString());
        } finally {
            // Close the resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                System.out.println("Error closing database resources: " + ex.toString());
            }
        }

        return returnStr.toString();
    }
}
