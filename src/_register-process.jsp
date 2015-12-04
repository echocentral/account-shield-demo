<%@ page import ="uk.co.revsys.utils.http.*" %>
<%@ page import ="org.apache.commons.io.IOUtils" %>
<%@ page import ="java.io.InputStream" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="java.sql.*" %>
<%!
    private String readResponse(HttpResponse response) throws IOException {
        InputStream responseStream = response.getInputStream();
        String responseText = "";
        if (responseStream != null) {
            responseText = IOUtils.toString(responseStream);
            responseStream.close();
        }
        return responseText;
    }
%>
<%
    String userid = request.getParameter("email");    
    String pwd = request.getParameter("password");
    String pwd2 = request.getParameter("password2");
    String destination = "register.html#error";

    //if (pwd == pwd2) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://db-dev.echo-central.com:3306/growthtree", "gtDemo", "871302");
        Statement st = conn.createStatement();
        ResultSet rs;

        rs = st.executeQuery("select * from users where email='" + userid + "'");
        if (rs.next()) {
            destination = "register.html#exists";
        } else if (st.executeUpdate("insert into users (email, password) values('" + userid + "','" + pwd + "')") == 1) {
            session.setAttribute("userid", userid);
            destination = "index.jsp#welcome";

            // Check with Account Shield
                out.println(userid);
                out.println(pwd);

                HttpClient httpClient = new HttpClientImpl();
                HttpRequest httpRequest = new HttpRequest("http://dev.echo-central.com:8080/account-shield/registerUser?userId=" + userid + "&email=" + userid);
                httpRequest.setCredentials(new BasicAuthCredentials("as-it@revolutionarysystems.co.uk", "testing123"));
                httpRequest.setMethod(HttpMethod.POST);
                HttpResponse httpResponse = httpClient.invoke(httpRequest);
                try {
                    String responseText = readResponse(httpResponse);
                    out.println(responseText);
                } catch (IOException ex) {
                    out.println(ex.toString());
                }
                //JSONArray json = new JSONArray(responseText);
            // END - Check with Account Shield

        }
    //} else destination = "register.html#pwd-mismatch";

    //response.sendRedirect(destination);
%>