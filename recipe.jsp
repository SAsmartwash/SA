<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*, java.util.*, java.text.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/c5f2e8b9cc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- vue -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
        integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
        integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
    <link href="recipe.css" rel="stylesheet">
    <link href="index.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>發票</title>
</head>
<body div="bg">
    <%
        String driverName = "com.mysql.jdbc.Driver";
        String userName = "root";
        String userPasswd = "1234";
        String dbName = "SADB";
        String tableName = "order";
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="+ userName + "&password=" + userPasswd;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection(url);
Statement statement = connection.createStatement();
String sql = "SELECT * FROM " + tableName;
ResultSet rs = statement.executeQuery(sql);
%>
    <%
    sql = "SELECT * FROM `order`";
    rs = smt.executeQuery(sql);
    String oid = "";
    String Co2Point = "";
    String Total = "";
    String recipe = "";
    while (rs.next()) {
    oid = rs.getString("OrderId");
    Co2Point = rs.getString("Co2Point");
    Total = rs.getString("Total");
    recipe = rs.getString("recipe");
    out.println("<div class='recipe'>");
    out.println("<h2>FK-"+rs.getString("recipe")+"</h2>");%>
                <!-- <button class="favorite-button" data-site-id="<%= sid %>" data-is-added="<%= favorite %>">
                    <i class="fa fa-heart"></i>
                </button> -->
                <%
    out.println("<p>"+rs.getString("Total")+"<br>"+rs.getString("Co2Point")+"</p>");
    out.println("</div>");
    }
    %>
</body>