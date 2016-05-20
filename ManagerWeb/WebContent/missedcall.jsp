<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="com.uniq.ConnectionManager"%>
<html>
<head>
    <title>Income calls</title>
 <script>
        window.history.forward(1);
</script>
</head>
<body >
<h2 align="center"><span style="color:lightseagreen; ">Missed Call Logs</span></h2>
<%
      try {
         
    	  Statement statement = null;
    	  ResultSet rs = null;
    	  Connection connection = ConnectionManager.getConnection();
    	  statement = connection.createStatement();
          String QueryString = "SELECT * from misscl order by sno";
          rs = statement.executeQuery(QueryString);
%>
<TABLE cellpadding="15" border="1" align="center">
    <TR>
         <TD><b>S.No</b></TD>
        <TD><b>Caller</b></TD>
        <TD><b>Time</b></TD>
    <%
    while (rs.next()) {
    %>
    <TR>
        <TD><%=rs.getInt(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(3)%></TD>
    </TR>
    <%   }    %>
    <%
   
    rs.close();
    statement.close();
    connection.close();
} catch (Exception ex) {
    %>
    
    <font size="+3" color="red"></b>
        <%
                out.println("Unable to connect to database.");
            }
        %></font>
    </TABLE>
</font>
</body>
</html>