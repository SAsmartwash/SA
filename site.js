
    const cycu = [24.957547210362748, 121.24075323625465];
    var map = L.map('map').setView(cycu, 16);

    var osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        minZoom: 16,
        maxZoom: 20,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    var marker = L.marker([24.957547210362748, 121.24075323625465]).addTo(map);

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
        marker.bindPopup("<strong>中原大學</strong><br>距離" + parseInt(distance) + "公尺<br><a href=orderlist.html>建立訂單</a>");
    }
    marker.on('click', clickInfo);

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
