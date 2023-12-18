<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page import="java.sql.*" %>

<%
    String User_ID = request.getParameter("User_ID");
    Connection con = DBConnector.getConnection();
    try {
        PreparedStatement pst1 = con.prepareStatement("DELETE FROM User_Detail WHERE User_ID = ?;");
        pst1.setString(1, User_ID);
        pst1.executeUpdate();

        PreparedStatement pst2 = con.prepareStatement("DELETE FROM User WHERE User_ID = ?;");
        pst2.setString(1, User_ID);
        pst2.executeUpdate();
    } catch (Exception ex) {
        Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
    }
%>
<script>
    window.alert("Record Deleted!");
    window.location.href = 'admin.jsp';
</script>
