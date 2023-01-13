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
    <header>
    </header>

    <div class="main">
        <div class="nav">
            <a href="javascript:void(0)" onclick="history.back()" value="上一頁"><i class="fa-solid fa-arrow-left"></i></a>
            <div class="flex-container">
                <a href="javascript:void(0)" onclick="openTab(event, 'Deliverway_im');">
                    <div class="tablink">
                        <p>立即外送</p>
                    </div>
                </a>
                <a href="javascript:void(0)" onclick="openTab(event, 'Deliverway_se');">
                    <div class="tablink bgwhite">
                        <p>自行外送</p>
                    </div>
                </a>
            </div>
        </div>
        <form id="Deliverway_se" class="tab">
            <div class="address">
                <p>自行外送</p>
                <p>請填好材質後定位當前位址，選擇站點建立訂單</p>
            </div>
            <section>
                <div class="or1">
                    <h2>洗衣材質</h2>
                    <%
sql = "SELECT * FROM  sa.material ";
rs = smt.executeQuery(sql);
String mid = "";
String name = "";
                    while (rs.next()) {
mid = rs.getString("MaterialId");
name = rs.getString("Material");%>
                    <div class="flex-row">
                        <%= mid %><p><%= name %></p><input type="radio" name="material" checked>
                    </div><%
                }
                %>
                </div>
                <div class="or1">
                    <h2>推薦洗衣方式</h2>
                    <div class="flex-sb">
                        <p>洗衣方式</p>
                        <select type="radio">
                            <option value="">#</option>
                        </select>
                    </div>
                    <div class="flex-sb">
                        <p>水溫</p>
                        <select type="radio">
                            <option value="">#</option>
                        </select>
                    </div>
                    <div class="flex-sb">
                        <p>烘衣</p>
                        <select type="radio">
                            <option value="">#</option>
                        </select>
                    </div>
                </div>
                <!-- <div class="or1">
                    <h2>預估費用</h2>
                </div> -->

                <div id="map"></div>
            </section>
        </form>
        <form id="Deliverway_im" class="tab">
            <div class="address">
                <p>立即外送</p>
                <select name="address" class="op">
                    <option value="">
                        <p>請選擇當前地址</p>
                    </option>
                    <option value="ad1">
                        <p>#</p>
                    </option>
                    <option value="ad2">
                        <p>##</p>
                    </option>
                </select>
            </div>
            <section>
                <div class="or1">
                    <h2>洗衣材質</h2>
                    <div class="flex-row">
                        <p>人造纖維</p><input type="radio" name="material" checked>
                    </div>
                    <div class="flex-row">
                        <p>動物纖維</p><input type="radio" name="material">
                    </div>
                    <div class="flex-row">
                        <p>其他</p><input type="radio" name="material">
                    </div>
                </div>
                <div class="or1">
                    <h2>推薦洗衣方式</h2>
                    <div class="flex-sb">
                        <p>洗衣方式</p>
                        <select type="radio">
                            <option value="">#</option>
                        </select>
                    </div>
                    <div class="flex-sb">
                        <p>水溫</p>
                        <select type="radio">
                            <option value="">#</option>
                        </select>
                    </div>
                    <div class="flex-sb">
                        <p>烘衣</p>
                        <select type="radio">
                            <option value="">#</option>
                        </select>
                    </div>
                </div>
                <div class="or1">
                    <h2>預估費用</h2>
                </div>
                <a href="" class="or1" type="submit">
                    <p class="btn">建立訂單</p>
                </a>
            </section>
        </form>
    </div>
</body>
<script src="site.js"></script>

<script>
    function openTab(evt, tabName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("tab");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" bgwhite", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.firstElementChild.className += " bgwhite";
    }
</script>
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