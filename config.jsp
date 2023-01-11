<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	try {
		String url="jdbc:mysql://localhost:3306/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");
		Statement smt = con.createStatement();
		String sql="USE `sa`";
		smt.execute(sql);
		ResultSet rs = null;
	
%>