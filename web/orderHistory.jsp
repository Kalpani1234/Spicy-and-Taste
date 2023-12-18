<%-- 
    Document   : orderHistory
    Created on : Aug 3, 2023, 8:37:30 PM
    Author     : TUF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.User" %>
<%@page import="app.classes.DBConnector" %>
<%@page import="java.sql.*" %>
<%
    User user = new User();
    Object userIdObj = session.getAttribute("id");
    int userId = 0;
    if (userIdObj != null) {
        try {
            userId = Integer.parseInt(userIdObj.toString());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
//    int id = Integer.parseInt(userIDObj.toString());

//    ResultSet rs1 = user.getOrderDeails();
    ResultSet rs1 = user.getOrderDeailsByOrderID(userId);
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>order history</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akronim&amp;display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets3/css/styles.min.css">
    </head>

    <body style="background: url(&quot;assets/img/mexican-food-composition.jpg&quot;);background-size: cover;">
        <!-- Start: header -->
        <div><!-- Start: Navbar Right Links (Dark) -->
            <nav class="navbar navbar-expand-md bg-dark py-3" data-bs-theme="dark"
                 style="padding-right: 0px;margin-right: 0px;">
                <div class="container"><!-- Start: logo --><a class="navbar-brand d-flex align-items-center" href="#"
                                                              style="padding-bottom: 0px;margin-bottom: 0px;padding-top: 0px;margin-top: 0px;"><img
                            src="assets/img/Logo.png" style="width: 129px;"></a><!-- End: logo --><button
                        data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-5"><span
                            class="visually-hidden">Toggle navigation</span><span
                            class="navbar-toggler-icon"></span></button>
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
            </nav><!-- End: Navbar Right Links (Dark) -->
        </div><!-- End: header -->
        <div
            style="padding-left: 55px;padding-top: 55px;padding-right: 55px;margin-right: 0px;background: rgba(33,37,41,0.8);margin-bottom: 0px;padding-bottom: 280px;">
            <h1
                style="font-size: 35px;font-family: 'Abril Fatface', serif;border-style: none;border-bottom-style: none;border-bottom-color: rgb(250,108,21);padding-top: 0px;">
                <span style="font-weight: normal !important; color: rgb(255, 255, 255);">Order History</span></h1>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Address</th>
                            <th>Contacts</th>
                            <th>Price</th>
                            <th>Delivery Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (rs1.next()) {

                        %>
                        <tr>
                            <td><% out.print(rs1.getString("Date")); %></td>
                            <td><% out.print(rs1.getString("Address")); %></td>
                            <td><% out.print(rs1.getString("Telephone")); %></td>
                            <td><% out.print(rs1.getString("Total_Bill")); %></td>
                            <td><% out.print(rs1.getString("Status")); %></td>
                        </tr>
                        <%

                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div><!-- Start: footer -->
        <div style="position: sticky;"><!-- Start: Footer Dark -->
            <footer class="text-center bg-dark">
                <div class="container text-white py-4 py-lg-5">
                    <ul class="list-inline" style="margin-bottom: 6px;">
                        <li class="list-inline-item me-4"><a class="link-light" href="#"><br><span
                                    style="color: RGBA(249,250,251,var(--bs-link-opacity,1)) ;">spicyandtasterestaurant@gmail.com</span></a>
                        </li>
                        <li class="list-inline-item me-4"><a class="link-light" href="#"><br><span
                                    style="color: RGBA(249,250,251,var(--bs-link-opacity,1)) ;">+94 76 234 6356</span></a>
                        </li>
                    </ul>
                    <div><img src="assets/img/Logo.png" style="max-width: 170px;"></div>
                    <p class="text-muted mb-0" style="color: rgb(108,117,125);"><span
                            style="color: rgb(108, 117, 125);">Copyright © 2023 Spicy &amp; Taste Restaurant</span></p>
                </div>
            </footer><!-- End: Footer Dark -->
        </div><!-- End: footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>