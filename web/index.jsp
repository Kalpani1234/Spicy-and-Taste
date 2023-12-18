<%@page import="app.classes.MD5"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if (request.getParameter("submit") != null) {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        Connection con = DBConnector.getConnection();

        try {
            String hashText = MD5.getMd5(Password);
            PreparedStatement pstmt1 = con.prepareStatement("SELECT User_ID, Password, Role FROM User WHERE Username = ?;");
            pstmt1.setString(1, Username);
            ResultSet rs = pstmt1.executeQuery();

            if (rs.next()) {
                if (hashText.equals(rs.getString("Password"))) {
                    if (rs.getString("Role").equals("Admin")) {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Success!')
    window.location.href = 'admin.jsp';
</script>
<%
} else if (rs.getString("Role").equals("Owner")) {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Success!')
    window.location.href = 'owner.jsp';
</script>
<%
} else if (rs.getString("Role").equals("Delivery")) {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Success!')
    window.location.href = 'delivery.jsp';
</script>
<%
} else {
    int id = rs.getInt("User_ID");
    session.setAttribute("id", id);
%>
<script LANGUAGE='JavaScript'>
    window.alert('Success!')
    window.location.href = 'home.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Password is wrong!')
    window.location.href = 'index.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('User does no exist!')
    window.location.href = 'index.jsp';
</script>
<%
            }
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
%>

<!DOCTYPE html>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim&amp;display=swap">
        <link rel="stylesheet" href="assets2/css/styles.min.css">
    </head>
    <body style="background: url(&quot;assets/img/top-view-table-full-delicious-food-composition.jpg&quot;) no-repeat, rgb(63,70,79);background-size: cover, auto;">
        <!-- Start: nav bar -->
        <div>
            <!-- Start: Navbar Right Links (Dark) -->
            <nav class="navbar navbar-expand-md bg-dark py-3" data-bs-theme="dark" style="padding-right: 0px;margin-right: 0px;">
                <div class="container">
                    <!-- Start: logo -->
                    <a class="navbar-brand d-flex align-items-center" href="#" style="padding-bottom: 0px;margin-bottom: 0px;padding-top: 0px;margin-top: 0px;">
                        <img src="assets/img/Logo.png" style="width: 129px;">
                    </a>
                    <!-- End: logo -->
                    <button class="navbar-toggler" data-bs-toggle="collapse">
                        <span class="visually-hidden">Toggle navigation</span>
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>
            <!-- End: Navbar Right Links (Dark) -->
        </div>
        <!-- End: nav bar -->
        <!-- Start: header -->
        <div style="text-align: center;">
            <h1 style="color: rgb(255,255,255);font-family: Akronim, serif;font-size: 80.52px;padding-top: 8px;text-shadow: 0px 0px 20px rgb(0,0,0), 0px 0px 20px rgb(0,0,0);">Taste the Foods</h1>
        </div>
        <!-- End: header -->
        <!-- Start: form -->
        <div>
            <!-- Start: Google Style Login -->
            <div class="login-card" style="background: #232729d7;margin-top: 0px;margin-bottom: 50px;">
                <div style="text-align: center;">
                    <img src="assets/img/Logo.png" style="width: 250px;">
                </div>
                <p class="profile-name-card"></p>
                <form action="#" class="form-signin" method="POST">
                    <span class="reauth-email"></span>
                    <input class="form-control" type="text" id="inputUsername" required="" placeholder="User Name" name="Username" autofocus="">
                    <input class="form-control" type="password" id="inputPassword" required="" name="Password" placeholder="Password">
                    <button class="btn btn-primary btn-lg d-block btn-signin w-100 btn-d" type="submit" name="submit" style="color: rgb(33,37,41);">Sign in</button>
                </form>
                <div class="row">
                    <div class="col">
                        <a class="forgot-password" href="Signup.jsp">Create Account...</a>
                    </div>
                </div>
            </div>
            <!-- End: Google Style Login -->
        </div>
        <!-- End: form -->
        <!-- Start: footer -->
        <div style="position: sticky;">
            <!-- Start: Footer Dark -->
            <footer class="text-center bg-dark">
                <div class="container text-white py-4 py-lg-5">
                    <ul class="list-inline" style="margin-bottom: 6px;">
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#">
                                <br>
                                <span style="color: RGBA(249,250,251,var(--bs-link-opacity,1)) ;">spicyandtasterestaurant@gmail.com</span>
                            </a>
                        </li>
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#">
                                <br>
                                <span style="color: RGBA(249,250,251,var(--bs-link-opacity,1)) ;">+94 76 234 6356</span>
                            </a>
                        </li>
                    </ul>
                    <div>
                        <img src="assets/img/Logo.png" style="max-width: 170px;">
                    </div>
                    <p class="text-muted mb-0">Copyright © 2023 Spicy &amp; Taste Restaurant</p>
                </div>
            </footer>
            <!-- End: Footer Dark -->
        </div>
        <!-- End: footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
