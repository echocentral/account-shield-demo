<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import ="java.sql.*" %>

 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>MySQL Test</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://db-dev.echo-central.com:3306/growthtree", "gtDemo", "871302");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from users;");
 
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("id") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>" + rs.getString("password") + " </td>");
                    out.println("</tr>");
                }
 
                rs.close();
                conn.close();
            %>
            </tbody>
        </table>
    </body>
</html>