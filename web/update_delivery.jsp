<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page import="java.sql.*" %>

<%
    String Delivery_ID = request.getParameter("Delivery_ID");
    Connection con = DBConnector.getConnection();
    try {
        PreparedStatement pst = con.prepareStatement("UPDATE Delivery SET Status = 'Delivered' WHERE Delivery_ID = ?;");
        pst.setString(1, Delivery_ID);
        pst.executeUpdate();
    } catch (Exception ex) {
        Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
    }
%>
<script>
    window.alert("Record Updated!");
    window.location.href = 'delivery.jsp';
</script>

