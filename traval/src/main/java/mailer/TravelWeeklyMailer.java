package mailer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;

import org.apache.commons.mail.HtmlEmail;

public class TravelWeeklyMailer {

    public static void main(String[] args) {
        TravelWeeklyMailer mailer = new TravelWeeklyMailer();
        mailer.sendWeeklyEmail();
    }

    private void sendWeeklyEmail() {
        try {
            HtmlEmail email = new HtmlEmail();
            MailerMaster mailerMaster = new MailerMaster();
            mailerMaster.setHtmlEmail(email);
            mailerMaster.setSubject("Weekly Travel Summary");
            mailerMaster.setToList("ashu.dua@mindacorporation.com");
            mailerMaster.setCcList("anand.kumar1@mindacorporation.com,siddharth.joshi@mindacorporation.com"); 
            
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
        int puneVisitCount = 0;
        int puneVisitdays=0;// Counter for Pune visits

        try {
            // Establish a database connection (modify with your database credentials)
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "Anand");

            // Execute SQL query to fetch data from the travel_request table for Pune visits only
            String query = "SELECT *, "
                    + "CASE WHEN MONTH(FromDate) = 1 THEN 'January'"
                    + " WHEN MONTH(FromDate) = 2 THEN 'February'"
                    + " WHEN MONTH(FromDate) = 3 THEN 'March'"
                    + " WHEN MONTH(FromDate) = 4 THEN 'April'"
                    + " WHEN MONTH(FromDate) = 5 THEN 'May'"
                    + " WHEN MONTH(FromDate) = 6 THEN 'June'"
                    + " WHEN MONTH(FromDate) = 7 THEN 'July'"
                    + " WHEN MONTH(FromDate) = 8 THEN 'August'"
                    + " WHEN MONTH(FromDate) = 9 THEN 'September'"
                    + " WHEN MONTH(FromDate) = 10 THEN 'October'"
                    + " WHEN MONTH(FromDate) = 11 THEN 'November'"
                    + " WHEN MONTH(FromDate) = 12 THEN 'December' END AS Month,"
                    + " CASE WHEN MONTH(FromDate) BETWEEN 1 AND 3 THEN 'Q4'"
                    + " WHEN MONTH(FromDate) BETWEEN 4 AND 6 THEN 'Q1'"
                    + " WHEN MONTH(FromDate) BETWEEN 7 AND 9 THEN 'Q2'"
                    + " WHEN MONTH(FromDate) BETWEEN 10 AND 12 THEN 'Q3' END AS Quarter"
                    + " FROM travel.travel_request WHERE location = 'Pune'"
                    + " ORDER BY fromDate DESC";


            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            
            // Process the result set and append data to the StringBuilder
            while (rs.next()) {
                puneVisitCount++; // Increment the counter for each visit to Pune

                String from = rs.getString("Fromdate");
                String to = rs.getString("ToDate");
                int days = rs.getInt("Days");
                puneVisitdays+=days;
                
                

                String month = rs.getString("month");
                String location = rs.getString("Location");
              /*  String purpose = rs.getString("Purpose");*/
                String quarter = rs.getString("Quarter");
                

                returnStr.append("<tr>")
                		
                		.append("<td>").append(quarter).append("</td>")
                		.append("<td>").append(month).append("</td>")
                        .append("<td>").append(from).append("</td>")
                        .append("<td>").append(to).append("</td>")
                        .append("<td>").append(days).append("</td>")
                        .append("<td>").append(location).append("</td>")
                        
                      /*  .append("<td>").append(purpose).append("</td>") */
                        .append("</tr>");
            }
            String greetingMessage = "Hello Sir,<br>"
                    + "<br>"
                    + "Total no. of days travelled to Pune are: " + puneVisitdays + ". "
                    + "<br>"	
                    + " The summary of the travel details is mentioned below:<br>"
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
                    + "padding: 5px;"  // Adjust the padding value to decrease cell height
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
                    + "<th>Quarter</th>"
                    + "<th>Month</th>"
                    + "<th>From</th>"
                    + "<th>To</th>"
                    + "<th>Days</th>"
                    + "<th>Location</th>"
                /*    + "<th>Purpose</th>" */
                    + "</tr>");

            returnStr.append("</table>")
                   
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
