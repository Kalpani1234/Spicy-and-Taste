<%-- 
    Document   : PlaceOrder
    Created on : 03-Aug-2023, 20:07:19
    Author     : G I M H A N I
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
    if (request.getParameter("submit") != null) {
        String foodname = request.getParameter("food_name");
        int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        String Username = request.getParameter("Username");
        String Date = request.getParameter("Date");
        String Address = request.getParameter("Address");
        Connection con = DBConnector.getConnection();

        try {
            PreparedStatement pstmt1 = con.prepareStatement("SELECT User_ID FROM User WHERE Username = ?;");
            pstmt1.setString(1, Username);
            ResultSet rs1 = pstmt1.executeQuery();

            if (rs1.next()) {
                String User_ID = rs1.getString("User_ID");
                PreparedStatement pstmt2 = con.prepareStatement("SELECT Food_ID,Price FROM food WHERE Name = ?;");
                pstmt2.setString(1, foodname);
                ResultSet rs2 = pstmt2.executeQuery();
                if (rs2.next()) {
                    String Food_ID = rs2.getString("Food_ID");
                    int Price = Integer.parseInt(rs2.getString("Price"));

                    int Total_Bill = Price * Quantity;

                    PreparedStatement pstmt3 = con.prepareStatement("INSERT into `order`(User_ID, Date, Total_Bill) VALUES(?, ?, ?);");
                    pstmt3.setString(1, User_ID);
                    pstmt3.setString(2, Date);
                    pstmt3.setInt(3, Total_Bill);
                    int a1 = pstmt3.executeUpdate();

                    if (a1 > 0) {

                        PreparedStatement pstmt4 = con.prepareStatement("SELECT `Order_ID` FROM `order` WHERE (`User_ID` = ? AND `Date` = ?);");
                        pstmt4.setString(1, User_ID);
                        pstmt4.setString(2, Date);
                        ResultSet rs3 = pstmt4.executeQuery();
                        if (rs3.next()) {
                            String Order_ID = rs3.getString("Order_ID");
                            PreparedStatement pstmt5 = con.prepareStatement("INSERT INTO `food_order` (`Food_ID`, `Order_ID`, `Quantity`) VALUES (?, ?, ?);");
                            pstmt5.setString(1, Food_ID);
                            pstmt5.setString(2, Order_ID);
                            pstmt5.setInt(3, Quantity);
                            int a2 = pstmt5.executeUpdate();

                            if (a2 > 0) {

                                PreparedStatement pstmt6 = con.prepareStatement("INSERT into delivery(User_ID, Order_ID, Address, Status) VALUES(?, ?, ?, ?);");
                                pstmt6.setString(1, User_ID);
                                pstmt6.setString(2, Order_ID);
                                pstmt6.setString(3, Address);
                                pstmt6.setString(4, "Pending");
                                int a3 = pstmt6.executeUpdate();

                                if (a3 > 0) {
%>
<script LANGUAGE='JavaScript'>
    window.alert('Order Added Successfully! Your total bill is: Rs.' +<%=Total_Bill%>+'.00')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
    }

} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'PlaceOrder.jsp';
</script>
<%
            }
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
%>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            />
        <title>place order</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Abril+Fatface&amp;display=swap"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Akronim&amp;display=swap"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="assetsPO/css/styles.min.css" />
    </head>
    <body
        style="
        background: url('assets/img/mexican-food-composition.jpg');
        background-size: cover;
        "
        >
        <!-- Start: header -->
        <div>
            <!-- Start: Navbar Right Links (Dark) -->
            <nav
                class="navbar navbar-expand-md bg-dark py-3"
                data-bs-theme="dark"
                style="padding-right: 0px; margin-right: 0px"
                >
                <div class="container">
                    <!-- Start: logo --><a
                        class="navbar-brand d-flex align-items-center"
                        href="#"
                        style="
                        padding-bottom: 0px;
                        margin-bottom: 0px;
                        padding-top: 0px;
                        margin-top: 0px;
                        "
                        ><img src="assets/img/Logo.png" style="width: 129px" /></a
                    ><!-- End: logo --><button
                        data-bs-toggle="collapse"
                        class="navbar-toggler"
                        data-bs-target="#navcol-5"
                        >
                        <span class="visually-hidden">Toggle navigation</span
                        ><span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navcol-5">
                        <ul class="navbar-nav ms-auto">
      <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
       <li class="nav-item">
                                <a class="nav-link" href="orderHistory.jsp">Order History</a>
                            </li>
                     <li class="nav-item">
                                <a class="nav-link" href="about.jsp">About Us</a>
                            </li>
                           
                            
                            <li class="nav-item" style="padding-left: 0px;">
                                <div class="btn-group"><button class="btn btn-primary" type="button"
                                                               style="color: rgb(33,37,41);background: rgb(251,106,17);border-style: none;padding-right: 10px;"><i
                                            class="fa fa-user"
                                            style="font-size: 17px;padding-right: 4px;"></i><strong>User</strong></button><button
                                        class="btn btn-primary dropdown-toggle dropdown-toggle-split btn-d"
                                        data-bs-toggle="dropdown" aria-expanded="false" type="button"
                                        style="border-style: none;border-bottom-style: none;"></button>
                                    <div class="dropdown-menu"
                                         style="padding-top: 3px;min-width: 112px;text-align: center;margin-bottom: 0px;padding-bottom: 3px;margin-top: 2px;">
                                        <a class="dropdown-item" href="index.jsp" style="padding-top: 0px;margin-bottom: 0px;">Log
                                            Out</a></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End: Navbar Right Links (Dark) -->
        </div>
        <!-- End: header --><!-- Start: Pretty Registration Form -->
        <div
            class="row register-form"
            style="margin-right: 0px; background: rgba(33, 37, 41, 0.87)"
            >
            <div class="col-md-8 offset-md-2">
                <form action="#" method="POST" class="custom-form" style="background: rgba(255, 255, 255, 0)">
                    <h1
                        style="
                        font-size: 35px;
                        font-family: 'Abril Fatface', serif;
                        border-style: none;
                        border-bottom-style: solid;
                        border-bottom-color: rgb(250, 108, 21);
                        "
                        >
                        <span
                            style="font-weight: normal !important; color: rgb(255, 255, 255)"
                            >Place an Order</span
                        >
                    </h1>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column">
                            <label class="col-form-label" for="name-input-field"
                                   ><span style="color: rgb(255, 255, 255)">Food Name </span></label
                            >
                        </div>
                        <div class="col-sm-6 input-column">
                            <input class="form-control" type="text" id="food_name" name="food_name" required/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column">
                            <label class="col-form-label" for="name-input-field"
                                   ><span style="color: rgb(255, 255, 255)">Quantity</span></label
                            >
                        </div>
                        <div class="col-sm-6 input-column">
                            <input class="form-control" type="number" id="Quantity" name="Quantity" required/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column">
                            <label class="col-form-label" for="name-input-field"
                                   ><span style="color: rgb(255, 255, 255)">Date</span></label
                            >
                        </div>
                        <div class="col-sm-6 input-column">
                            <input class="form-control" type="Date" id="Date" name="Date" required/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column">
                            <label class="col-form-label" for="name-input-field"
                                   ><span style="color: rgb(255, 255, 255)">User Name </span></label
                            >
                        </div>
                        <div class="col-sm-6 input-column">
                            <input class="form-control" type="text" id="Username" name="Username" required/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column">
                            <label class="col-form-label" for="name-input-field"
                                   ><span style="color: rgb(255, 255, 255)">Address</span></label
                            >
                        </div>
                        <div class="col-sm-6 input-column">
                            <input class="form-control" type="text" id="Address" name="Address" required/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-sm-4 label-column">
                            <label class="col-form-label" for="name-input-field"
                                   ><span style="color: rgb(255, 255, 255)">Contacts</span></label
                            >
                        </div>
                        <div class="col-sm-6 input-column">
                            <input class="form-control" type="text" id="Telephone" name="Telephone" required/>
                        </div>
                    </div>
                    <button type="submit" name="submit" class="btn btn-light submit-button order-btn" >
                        Order Now
                    </button>                       
                </form>
            </div>
        </div>
        <!-- End: Pretty Registration Form --><!-- Start: footer -->
        <div style="position: sticky">
            <!-- Start: Footer Dark -->
            <footer class="text-center bg-dark">
                <div class="container text-white py-4 py-lg-5">
                    <ul class="list-inline" style="margin-bottom: 6px">
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#"
                               ><br /><span
                                    style="color: RGBA(249, 250, 251, var(--bs-link-opacity, 1))"
                                    >spicyandtasterestaurant@gmail.com</span
                                ></a
                            >
                        </li>
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#"
                               ><br /><span
                                    style="color: RGBA(249, 250, 251, var(--bs-link-opacity, 1))"
                                    >+94 76 234 6356</span
                                ></a
                            >
                        </li>
                    </ul>
                    <div><img src="assets/img/Logo.png" style="max-width: 170px" /></div>
                    <p class="text-muted mb-0" style="color: rgb(108, 117, 125)">
                        <span style="color: rgb(108, 117, 125)"
                              >Copyright © 2023 Spicy &amp; Taste Restaurant</span
                        >
                    </p>
                </div>
            </footer>
            <!-- End: Footer Dark -->
        </div>
        <!-- End: footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


