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
                        <p>自行送洗</p>
                    </div>
                </a>
            </div>
        </div>
        <form id="Deliverway_se" class="tab" name="orderform" method="post" action="order.jsp">
            <input type="text" name="DeliverWay" value="自行運送" hidden>
            <div class="address">
                <p>自行運送</p>
                <p>請先填好材質後，再選擇站點建立訂單</p>
            </div>
            <section>
                <div class="or1">
                    <div class="flex-container">
                        <label for="BagId">
                            <h3>袋子ID :</h3>
                        </label>
                        <input type="number" name="BagId" id="BagId" min="1" max="99999" required="required">
                    </div>
                </div>
                <div class="or1">
                    <h2>洗衣材質</h2>
                    <%
                    sql = "SELECT * FROM  sa.material ";
                    rs = smt.executeQuery(sql);
                    String aid = "";
                    String address = "";
                    String mid = "";
                    String mname = "";
                    String tid = "";
                    String tname = "";
                    String wid = "";
                    String wname = "";
                    String did = "";
                    String dname = "";
                    String cn = "";
                    String cname = "";
                    while (rs.next()) {
                    mid = rs.getString("MaterialId");
                    mname = rs.getString("Material");%>
                    <div class="flex-row">
                        <%= mid %><p><%= mname %></p><input type="radio" value="<%= mid %>" name="material"
                            required="required" checked>
                    </div><%
                }
                %>
                </div>
                <div class="or1">
                    <h2>推薦洗衣方式</h2>

                    <div class="flex-sb">
                        <p>洗衣方式</p>
                        <select>
                            <%
                    sql = "SELECT * FROM  sa.washway ";
                    rs = smt.executeQuery(sql);
                    
                                        while (rs.next()) {
                                            wid = rs.getString("WashId");
                                            wname = rs.getString("WashWay");%>
                            <option value="<%= wid %>"><%= wname %></option>
                            <%}%>
                        </select>
                    </div>

                    <div class="flex-sb">
                        <p>水溫</p>
                        <select>
						<%
                            sql = "SELECT * FROM sa.watertemperture ";
                            rs = smt.executeQuery(sql);
                            while (rs.next()) {
                            tid = rs.getString("WaterTempertureId");
                            tname = rs.getString("Temperture");%>
                            <option value="<%= tid %>"><%= tname %></option>
                            <%}%>
                        </select>
                    </div>

                    <div class="flex-sb">
                        <p>烘衣</p>
                        <select>
                            <%
                    sql = "SELECT * FROM  sa.dry ";
                    rs = smt.executeQuery(sql);
                    
                                        while (rs.next()) {
                                            did = rs.getString("DryId");
                                            dname = rs.getString("Dry");%>
                            <option value="<%= tid %>"><%= dname %></option>
                            <%
                        }
                        %>
                        </select>
                    </div>
                </div>
                <!-- <div class="or1">
                    <h2>預估費用</h2>
                </div> -->
                <div class="or1">
                    <h2>付款方式</h2>
                    <%
                    sql = "SELECT * FROM  sa.credit ";
                    rs = smt.executeQuery(sql);
                    
                    while (rs.next()) {
                    cn = rs.getString("CreditNum");
                    cname = rs.getString("CreditName");%>
                    <div class="flex-row">
                        <%= cn %><p><%= cname %></p><input type="radio" name="credit" required="required" checked>
                    </div><%
                }
                %>
                </div>
                <div id="map"></div>
            </section>
        </form>
        <form id="Deliverway_im" class="tab" name="orderform" method="post" action="order.jsp">
            <input type="text" name="DeliverWay" value="立即送洗" hidden>
            <div class="address">
                <p>立即送洗</p>
                <select name="address" class="op">
                    <%
                    sql = "SELECT * FROM sa.address ";
                    rs = smt.executeQuery(sql);
                    while (rs.next()) {
                    aid = rs.getString("AddressId");
                    address = rs.getString("Address");%>
                    <option value="<%= aid %>">
                        <p><%= address %></p>
                    </option>
                    <%
                }
                %>
                </select>
            </div>
            <section>
                <div class="or1">
                    <div class="flex-container">
                        <label for="bagid">
                            <h3>袋子ID :</h3>
                        </label>
                        <input type="number" name="bag" id="bagid" min="1" max="99999" required="required">
                    </div>
                </div>
                <div class="or1">
                    <h2>洗衣材質</h2>
                    <%
                    sql = "SELECT * FROM  sa.material ";
                    rs = smt.executeQuery(sql);
                    
                    while (rs.next()) {
                    mid = rs.getString("MaterialId");
                    mname = rs.getString("Material");%>
                    <div class="flex-row">
                        <%= mid %><p><%= mname %></p><input type="radio" name="material" required="required" checked>
                    </div><%
                }
                %>
                </div>
                <div class="or1">
                    <h2>推薦洗衣方式</h2>
                    <div class="flex-sb">
                        <p>洗衣方式</p>
                        <select>
                            <%
                    sql = "SELECT * FROM  sa.washway ";
                    rs = smt.executeQuery(sql);
                                        while (rs.next()) {
                                            wid = rs.getString("WashId");
                                            wname = rs.getString("WashWay");%>
                            <option value="<%= wid %>"><%= wname %></option>
                            <%}%>
                        </select>
                    </div>

                    <div class="flex-sb">
                        <p>水溫</p>
                        <select>
						<%
                            sql = "SELECT * FROM sa.watertemperture ";
                            rs = smt.executeQuery(sql);
                            while (rs.next()) {
                            tid = rs.getString("WaterTempertureId");
                            tname = rs.getString("Temperture");%>
                            <option value="<%= tid %>"><%= tname %></option>
                            <%}%>
                        </select>
                    </div>

                    <div class="flex-sb">
                        <p>烘衣</p>
                        <select>
                            <%
                    sql = "SELECT * FROM  sa.dry ";
                    rs = smt.executeQuery(sql);
                    
                                        while (rs.next()) {
                                            did = rs.getString("DryId");
                                            dname = rs.getString("Dry");%>
                            <option value="<%= tid %>"><%= dname %></option>
                            <%
                        }
                        %>
                        </select>
                    </div>
                </div>
                <div class="or1">
                    <h2>付款方式</h2>
                    <%
                    sql = "SELECT * FROM  sa.credit";
                    rs = smt.executeQuery(sql);
                    
                    while (rs.next()) {
                    cn = rs.getString("CreditNum");
                    cname = rs.getString("CreditName");%>
                    <div class="flex-row">
                        <%= cn %><p><%= cname %></p><input type="radio" name="credit" required="required" checked>
                    </div><%
                }
                %>
                </div>
                <div class="or1">
                    <button type='submit' value='Submit'>
                        <h2>建立訂單</h2>
                    </button>
                </div>
            </section>
            <!-- <div class="or1">
                    <h2>預估費用</h2>
                </div> -->
        </form>
    </div>
</body>
<script>
    const cycu = [24.957547210362748, 121.24075323625465];
    var map = L.map('map').setView(cycu, 16);

    var osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        minZoom: 12,
        maxZoom: 20,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    var marker1 = L.marker([24.95756, 121.24053]).addTo(map);
    var marker2 = L.marker([24.97030, 121.26342]).addTo(map);
    var marker3 = L.marker([24.96810, 121.19532]).addTo(map);
    var marker4 = L.marker([24.94719, 121.22900]).addTo(map);
    var marker5 = L.marker([24.99032, 121.23218]).addTo(map);
    var marker6 = L.marker([24.95409, 121.24190]).addTo(map);

    map.locate({
        setView: false,
        watch: true,
        enableHighAccuracy: true
    });
    const self = L.marker([24.957547210362748, 121.24075323625465]).addTo(map).bindPopup("<strong>現在位置</strong>")
        .openPopup();
    const circle = L.circle([24.957547210362748, 121.24075323625465], 50).addTo(map);

    function clickInfo(e) {
        var c = L.latLng(e.latlng)
        var distance = c.distanceTo(self.getLatLng());
        marker1.bindPopup("<strong>中壢中原店<input type='number' name='SiteName' value='中壢中原店' hidden></strong><br>距離" +
            parseInt(
                distance) + "公尺<br><button type='submit' value='Submit'>建立訂單</button>");
        marker2.bindPopup("<strong>中壢元智店<input type='number' name='SiteName' value='中壢元智店' hidden></strong><br>距離" +
            parseInt(
                distance) + "公尺<br><button type='submit' value='Submit'>建立訂單</button>");
        marker3.bindPopup("<strong>中壢中央店<input type='number' name='SiteName' value='中壢中央店' hidden></strong><br>距離" +
            parseInt(
                distance) + "公尺<br><button type='submit' value='Submit'>建立訂單</button>");
        marker4.bindPopup("<strong>中壢健行店<input type='number' name='SiteName' value='中壢健行店' hidden></strong><br>距離" +
            parseInt(
                distance) + "公尺<br><button type='submit' value='Submit'>建立訂單</button>");
        marker5.bindPopup("<strong>中壢萬能店<input type='number' name='SiteName' value='中壢萬能店' hidden></strong><br>距離" +
            parseInt(
                distance) + "公尺<br><button type='submit' value='Submit'>建立訂單</button>");
        marker6.bindPopup("<strong>中壢弘揚店<input type='number' name='SiteName' value='中壢弘揚店' hidden></strong><br>距離" +
            parseInt(
                distance) + "公尺<br><button type='submit' value='Submit'>建立訂單</button>");

    }
    marker1.on('click', clickInfo);
    marker2.on('click', clickInfo);
    marker3.on('click', clickInfo);
    marker4.on('click', clickInfo);
    marker5.on('click', clickInfo);
    marker6.on('click', clickInfo);

    function onLocationError(e) {
        alert(e.message);
    }
    map.on('locationerror', onLocationError);

    function onLocationFound(e) {
        self.setLatLng(e.latlng);
        circle.setLatLng(e.latlng);
        circle.setRadius(e.accuracy);
        map.panTo(e.latlng);
    }

    map.on('locationfound', onLocationFound);

    // mapbutton
    function map_open(e) {
        document.getElementById("mapDiv").style.display = "block";
        document.getElementById("openMap").style.display = "none";
        map.invalidateSize();
    }

    function map_close() {
        document.getElementById("mapDiv").style.display = "none";
        document.getElementById("openMap").style.display = "block";
        map.invalidateSize();
    }
</script>

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