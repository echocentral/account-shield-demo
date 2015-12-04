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
    String sessionid = request.getParameter("asid");
    String destination = "login.html#invalid";

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://db-dev.echo-central.com:3306/growthtree", "gtDemo", "871302");
    Statement st = conn.createStatement();
    ResultSet rs;

    rs = st.executeQuery("select * from users where email='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);

        // Check with Account Shield
            out.println(userid);
            out.println(pwd);
            out.println(sessionid);

            HttpClient httpClient = new HttpClientImpl();
            HttpRequest httpRequest = new HttpRequest("http://dev.echo-central.com:8080/account-shield/checkLogin?sessionId=" + sessionid + "&userId=" + userid);
            httpRequest.setCredentials(new BasicAuthCredentials("as-it@revolutionarysystems.co.uk", "testing123")); // "693e2ba0-5541-41c4-ab7d-5e389fffa43e"
            httpRequest.setMethod(HttpMethod.GET);
            HttpResponse httpResponse = httpClient.invoke(httpRequest);
            try {
                String responseText = readResponse(httpResponse);
                out.println(responseText);
            } catch (IOException ex) {
                out.println(ex.toString());
            }
            //JSONArray json = new JSONArray(responseText);
        // END - Check with Account Shield

        destination = "index.jsp";
    }

    //response.sendRedirect(destination);
%>