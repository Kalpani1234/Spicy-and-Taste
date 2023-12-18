<%@page import="app.classes.MD5"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
    if (request.getParameter("submit") != null) {
        String Name = request.getParameter("Name");
        String Username = request.getParameter("Username");
        String Telephone = request.getParameter("Telephone");
        String Email = request.getParameter("Email");
        String Password = request.getParameter("Password");
        String Repeatpassword = request.getParameter("Repeatpassword");
        Connection con = DBConnector.getConnection();

        if (Password.equals(Repeatpassword)) {
            String hashText = MD5.getMd5(request.getParameter("Password"));
            try {
                PreparedStatement pstmt1 = con.prepareStatement("INSERT INTO User (Username, Password, Role) VALUES(?, ?, ?);");
                pstmt1.setString(1, Username);
                pstmt1.setString(2, hashText);
                pstmt1.setString(3, "Guest");
                int a1 = pstmt1.executeUpdate();

                if (a1 > 0) {
                    PreparedStatement pstmt2 = con.prepareStatement("SELECT User_ID FROM User WHERE Username = ?;");
                    pstmt2.setString(1, Username);
                    ResultSet rs = pstmt2.executeQuery();

                    if (rs.next()) {
                        String userId = rs.getString("User_ID");
                        PreparedStatement pstmt3 = con.prepareStatement("INSERT INTO User_Detail (User_ID, Name, Telephone, Email) VALUES(?, ?, ?, ?)");
                        pstmt3.setString(1, userId);
                        pstmt3.setString(2, Name);
                        pstmt3.setString(3, Telephone);
                        pstmt3.setString(4, Email);
                        int a2 = pstmt3.executeUpdate();

                        if (a2 > 0) {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Record Added Successfully!')
    window.location.href = 'Signup.jsp';
</script>
<%
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'Signup.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'Signup.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'Signup.jsp';
</script>
<%
        }
    } catch (Exception ex) {
        Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Password and the Repeat Password does not match!')
    window.location.href = 'home.jsp';
</script>
<%
        }
    }
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <title>Register</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim&amp;display=swap" />
        <link rel="stylesheet" href="assets/css/styles.min.css" />
    </head>
    <body style="
          background: url('assets/img/mexican-food-composition.jpg');
          background-size: cover;
          ">
        <!-- Start: nav bar -->
        <div>
            <!-- Start: Navbar Right Links (Dark) -->
            <nav class="navbar navbar-expand-md bg-dark py-3" data-bs-theme="dark" style="padding-right: 0px; margin-right: 0px">
                <div class="container">
                    <!-- Start: logo -->
                    <a class="navbar-brand d-flex align-items-center" href="#" style="padding-bottom: 0px;margin-bottom: 0px;padding-top: 0px;margin-top: 0px;">
                        <img src="assets/img/Logo.png" style="width: 129px" />
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
        <div style="text-align: center">
            <h1 style="color: rgb(255, 255, 255); font-family: Akronim, serif; font-size: 80.52px; padding-top: 8px; text-shadow: 0px 0px 20px rgb(0, 0, 0), 0px 0px 20px rgb(0, 0, 0), 0px 0px; "> Taste the Foods </h1>
        </div>
        <!-- End: header -->
        <div>
            <div class="row d-flex d-xl-flex justify-content-center justify-content-xl-center" style=" margin-right: 0px; margin-left: 0px;padding-bottom: 50px; padding-left: 20px;padding-right: 20px;margin-top: 0px; padding-top: 0px; ">
                <div class="col-sm-12 col-lg-10 col-xl-9 col-xxl-7 reg" style="border-radius: 5px; background: #232729d7">
                    <div class="p-5">
                        <div></div>
                        <div class="text-center">
                            <h4 class="text-dark mb-4">
                                <strong>
                                    <span style="color: rgb(162, 162, 162)">Create an Account</span>
                                </strong>
                            </h4>
                        </div>
                        <!-- Start: Register Form -->
                        <form action="#" method="POST" class="user">
                            <!-- Start: name -->
                            <div class="mb-3">
                                <input class="form-control form-control-user" type="text" placeholder="Name" name="Name" required="" />
                            </div>
                            <!-- End: Name -->
                            <!-- Start: Username -->
                            <div class="mb-3">
                                <input class="form-control form-control-user" type="text" placeholder="Username" name="Username" required="" />
                            </div>
                            <!-- End: Username -->
                            <!-- Start: Username -->
                            <div class="mb-3">
                                <input class="form-control form-control-user" type="text" placeholder="Telephone" name="Telephone" required="" />
                            </div>
                            <!-- End: Username -->
                            <!-- Start: Email -->
                            <div class="mb-3">
                                <input class="form-control form-control-user" type="Email" id="Email" placeholder="Email" name="Email" required="" />
                            </div>
                            <!-- End: Email -->
                            <!-- Start: Password -->
                            <div class="row mb-3">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input class="form-control form-control-user" type="Password" id="Password" placeholder="Password" name="Password" required="" />
                                </div>
                                <div class="col-sm-6">
                                    <input class="form-control form-control-user" type="password" id="Repeatpassword" placeholder="Repeat password" name="Repeatpassword" required="" />
                                </div>
                            </div>
                            <!-- End: Password -->
                            <!-- Start: Email Error Message -->
                            <div class="row mb-3">
                                <p id="emailErrorMsg" class="text-danger" style="display: none"> Paragraph </p>
                                <p id="passwordErrorMsg" class="text-danger" style="display: none"> Paragraph </p>
                            </div>
                            <!-- End: Email Error Message -->
                            <button class="btn btn-primary d-block btn-user w-100 reg-btn" id="submit" type="submit" name="submit" style="border-style: none">
                                <strong>Register Account</strong>
                            </button>
                            <hr style="color: rgb(255, 255, 255)" />
                        </form>
                        <!-- End: Register Form -->
                        <!-- Start: Forgot Password -->
                        <div class="text-center"></div>
                        <!-- End: Forgot Password -->
                        <div style="text-align: center">
                            <a class="forgot-password" href="index.jsp" style="font-size: 14px">Already have an account? Login</a>
                        </div>
                    </div>
                </div>
            </div>
            <script>/*
             let email = document.getElementById("email");
             let password = document.getElementById("password");
             let verifyPassword = document.getElementById("verifyPassword");
             let submit = document.getElementById("submit");
             let emailErrorMsg = document.getElementById("emailErrorMsg");
             let passwordErrorMsg = document.getElementById("passwordErrorMsg");
             
             function displayErrorMsg(type, msg) {
             if (type == "email") {
             emailErrorMsg.style.display = "block";
             emailErrorMsg.innerHTML = msg;
             submit.disabled = true;
             } else {
             passwordErrorMsg.style.display = "block";
             passwordErrorMsg.innerHTML = msg;
             submit.disabled = true;
             }
             }
             
             function hideErrorMsg(type) {
             if (type == "email") {
             emailErrorMsg.style.display = "none";
             emailErrorMsg.innerHTML = "";
             submit.disabled = true;
             if (passwordErrorMsg.innerHTML == "")
             submit.disabled = false;
             } else {
             passwordErrorMsg.style.display = "none";
             passwordErrorMsg.innerHTML = "";
             if (emailErrorMsg.innerHTML == "")
             submit.disabled = false;
             }
             }
             // Validate password upon change
             password.addEventListener("change", function () {
             // If password has no value, then it won't be changed and no error will be displayed
             if (password.value.length == 0 && verifyPassword.value.length == 0)
             hideErrorMsg("password");
             // If password has a value, then it will be checked. In this case the passwords don't match
             else if (password.value !== verifyPassword.value)
             displayErrorMsg("password", "Passwords do not match");
             // When the passwords match, we check the length
             else {
             // Check if the password has 8 characters or more
             if (password.value.length >= 8)
             hideErrorMsg("password");
             else
             displayErrorMsg("password", "Password must be at least 8 characters long");
             }
             });
             verifyPassword.addEventListener("change", function () {
             if (password.value !== verifyPassword.value)
             displayErrorMsg("password", "Passwords do not match");
             else {
             // Check if the password has 8 characters or more
             if (password.value.length >= 8)
             hideErrorMsg("password");
             else
             displayErrorMsg("password", "Password must be at least 8 characters long");
             }
             });
             // Validate email upon change
             email.addEventListener("change", function () {
             // Check if the email is valid using a regular expression (string@string.string)
             if (email.value.match(/^[^@]+@[^@]+\.[^@]+$/))
             hideErrorMsg("email");
             else
             displayErrorMsg("email", "Invalid email");
             });
             */
            </script>
        </div>
        <!-- Start: footer -->
        <div style="position: sticky">
            <!-- Start: Footer Dark -->
            <footer class="text-center bg-dark">
                <div class="container text-white py-4 py-lg-5">
                    <ul class="list-inline" style="margin-bottom: 6px">
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#">
                                <br />
                                <span style="color: RGBA(249, 250, 251, var(--bs-link-opacity, 1))">spicyandtasterestaurant@gmail.com</span>
                            </a>
                        </li>
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#">
                                <br />
                                <span style="color: RGBA(249, 250, 251, var(--bs-link-opacity, 1))">+94 76 234 6356</span>
                            </a>
                        </li>
                    </ul>
                    <div>
                        <img src="assets\img\Logo.png" style="max-width: 170px" />
                    </div>
                    <p class="text-muted mb-0" style="color: rgb(108, 117, 125)">
                        <span style="color: rgb(108, 117, 125)">Copyright © 2023 Spicy &amp; Taste Restaurant</span>
                    </p>
                </div>
            </footer>
            <!-- End: Footer Dark -->
        </div>
        <!-- End: footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

