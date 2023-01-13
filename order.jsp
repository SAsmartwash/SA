<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
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
    String aid = request.getParameter("aid");
    String address = request.getParameter("address");
    String mid = request.getParameter("mid");
    String mname = request.getParameter("mname");
    String tid = request.getParameter("tid");
    String tname = request.getParameter("tname");
    String wid = request.getParameter("wid");
    String wname = request.getParameter("wname");
    String did = request.getParameter("did");
    String dname = request.getParameter("dname");
    String cn = request.getParameter("cn");
    String cname = request.getParameter("cname");
                sql = "SELECT * FROM cart WHERE mid = '" + session.getAttribute("member") + "'";
                rs = smt.executeQuery(sql);

                String pid = "";
                int quantity = 0;
                int setnumber = 0;
                while (rs.next()) {
                    pid = rs.getString("pid");
                    quantity = Integer.parseInt(rs.getString("quantity"));
                    setnumber = Integer.parseInt(rs.getString("setnumber"));
name = rs.getString("name");
                    sql = "UPDATE product SET quantity = '" + (quantity - setnumber) + "' WHERE pid = '" + pid + "'";
                    con.createStatement().executeUpdate(sql);

sql = "INSERT INTO `order` (price, mid, pid, amount, count, username,address, tel ,name) VALUES( '" + price + "','"+ session.getAttribute("member") + "', '" + pid + "', '" + setnumber + "', '" + count + "', '" + username + "', '" + address + "', '" + tel + "', '" + name + "')";
                    con.createStatement().executeUpdate(sql);
                }

                sql = "DELETE FROM cart WHERE mid = '" + session.getAttribute("member") + "'";
                con.createStatement().executeUpdate(sql);
    %>
    <script>
        swal ({
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
