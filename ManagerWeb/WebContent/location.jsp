<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%> 
<%@ page import="com.uniq.ConnectionManager"%>
<html>
<head>
<title>Income calls</title>
<script>
	
	</script>
	<script>
	var map = null;
	var marker = null;
	var directionsDisplay = null;
	var directionsService;//new google.maps.DirectionsService();
	//directionsService = new google.maps.DirectionsService();
    function initialize() {
    	directionsDisplay = new google.maps.DirectionsRenderer();
    	
      var myLatlng = new google.maps.LatLng(13.050309,80.234236);
      var myOptions = {
        zoom: 18,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
       map = new google.maps.Map(document.getElementById("googleMap"), myOptions);
       
        marker = new google.maps.Marker({
    	      position: myLatlng,
    	      map: map,
    	      title: 'Default Marker Place!'
    	  }); 
     
     directionsDisplay.setMap(map);
     directionsDisplay.setPanel(document.getElementById('panel'));
    }
    
    function calcRoute() {
    	
    	  var request = {
    	      origin:new google.maps.LatLng(13.050309,80.234236),
    	      destination:new google.maps.LatLng(13.083512,80.234528),
    	      travelMode: google.maps.TravelMode.DRIVING
    	  };
    	  directionsService.route(request, function(response, status) {
    	    if (status == google.maps.DirectionsStatus.OK) {
    	      directionsDisplay.setDirections(response);
    	    }
    	  });
    	}
      function loadScript() {
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = "http://maps.google.com/maps/api/js?v=3.exp&sensor=false&callback=initialize";
      document.body.appendChild(script);
    }

    window.onload = loadScript;


</script>
</head>
<body>

<center><div id="googleMap" style="width: 500px; height: 380px;"></div></center>
	<form>
		<h2 align="center">
			<span style="color: lightseagreen;">Location Details</span>
		</h2>
		<%
			try {

				Statement statement = null;
				ResultSet rs = null;
				Connection connection = ConnectionManager.getConnection();
				statement = connection.createStatement();
				String QueryString = "SELECT * from location";
				rs = statement.executeQuery(QueryString);
		%>
		<TABLE cellpadding="15" border="1" align="center">
			<TR>

				<TD><b>Latitude</b></TD>
				<TD><b>Longitude</b></TD>
				<TD><b>GoogleMap </b></TD>
			<!-- 	<TD><b>Routes </b></TD>  -->

				<%
					while (rs.next()) {
				%>
			
			<TR>
				<TD><input type="text" id="lat" value='<%=rs.getString(1)%>' /></TD>
				<TD><input type="text" id="lang" value='<%=rs.getString(2)%>' /></TD>
				<TD><input type='Button'
					onclick="map.setCenter(new google.maps.LatLng('<%=rs.getString(1)%>','<%=rs.getString(2)%>'));marker.setPosition(new google.maps.LatLng('<%=rs.getString(1)%>','<%=rs.getString(2)%>'))" value='Show Me'
					 /></TD>
			<!-- 	<TD><input type='Button' onclick="calcRoute();" value='Show Route'/></TD> -->
			</TR>
			
			<%
				}

					rs.close();
					statement.close();
					connection.close();
				} catch (Exception ex) {

					out.println("Unable to connect to database.");
				}
			%>
		</TABLE>
		</form>
		
</body>
</html>