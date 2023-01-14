<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*, java.util.*, java.text.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/c5f2e8b9cc.js" crossorigin="anonymous"></script>
    <!-- vue -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
        integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
        integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
    <link href="index.css" rel="stylesheet">
    <link href="orderlist.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>智慧喜</title>
</head>


<body>
    <%
    String Status =request.getParameter("Status");
    int BagId = Integer.parseInt(request.getParameter("BagId"));
    String SiteName =request.getParameter("SiteName");
    String DeliverWay =request.getParameter("DeliverWay");
    int aid = Integer.parseInt(request.getParameter("aid"));
    String address = request.getParameter("address");
    int mid = Integer.parseInt(request.getParameter("mid"));
    String mname = request.getParameter("mname");
    int tid = Integer.parseInt(request.getParameter("tid"));
    String tname = request.getParameter("tname");
    int wid = Integer.parseInt(request.getParameter("wid"));
    String wname = request.getParameter("wname");
    int did = Integer.parseInt(request.getParameter("did"));
    String dname = request.getParameter("dname");
    int cn = Integer.parseInt(request.getParameter("cn"));
    String cname = request.getParameter("cname");
    sql = "UPDATE `bag` SET `Status` =  Status where `BagId` = BagId ";
    con.createStatement().executeUpdate(sql);
    sql = "INSERT INTO `order` (`BagId`, `SiteName`, `DeliverWay`, `Address_AddressId`, `Address`, `MaterialId`, `WaterTempertureId`, `WashId`, `DryId`, `CreditNum`)VALUES('"+BagId+"','"+SiteName+"','"+DeliverWay+"','"+aid+"', '"+address+"','"+mid+"','"+tid+"','"+wid+"','"+did+"','"+cn+"')";
    con.createStatement().executeUpdate(sql);
    %>
    <script>
        swal({
            title: "購買成功",
            html: "<a href='index.jsp'><input type='button' class='swal-btn btn btn-success' value='查看訂單'></input></a>",
            showConfirmButton: false,
            allowOutsideClick: false,
            allowEscapeKey: false
        });
    </script>
</body>
<%
                con.close();
            }

            catch (SQLException sExec) {
                out.println("SQL錯誤!" + sExec.toString());
            }
        }

        catch (ClassNotFoundException err) {
            out.println("class錯誤" + err.toString());
        }
    %>

</html>