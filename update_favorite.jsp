<%@page import="java.sql.*"%>
<%
String siteId = request.getParameter("siteId");
int favorite = Integer.parseInt(request.getParameter("favorite")) ? 1 : 0;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sa","root","1234");
Statement st = con.createStatement();
st.executeUpdate("UPDATE site SET Favorite = "+ favorite + " WHERE SiteId = '"+ siteId +"'");
st.close();
con.close();
response.sendRedirect("site.jsp");
} catch (Exception e) {
response.sendRedirect("error.jsp");
}
%>