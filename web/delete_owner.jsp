<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page import="java.sql.*" %>

<%
    String Food_ID = request.getParameter("Food_ID");
    Connection con = DBConnector.getConnection();
    try {
        PreparedStatement pst = con.prepareStatement("DELETE FROM food WHERE Food_ID = ?");
        pst.setString(1, Food_ID);
        pst.executeUpdate();
    } catch (Exception ex) {
        Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
    }
%>
<script>
    window.alert("Record Deleted!");
    window.location.href = 'owner.jsp';
</script>

