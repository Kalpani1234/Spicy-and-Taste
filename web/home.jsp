<%-- 
    Document   : home
    Created on : Aug 6, 2023, 9:58:59 PM
    Author     : dtc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.DBConnector" %>
<%@page import="java.sql.*" %>
<%
    DBConnector dbcon = new DBConnector();
    Connection con = dbcon.getConnection();
    String sql = "SELECT * FROM food";
    PreparedStatement pstmt = con.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            />
        <title>RAD home</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="assets4/css/styles.min.css" />
    </head>
    <body style="background: rgb(63, 70, 79)">
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
        <!-- End: header --><!-- Start: Masonry gallery cards responsive -->
        <div style="padding-top: 20px">
            <!-- Start: cards -->
            <div
                class="row"
                data-masonry='{"percentPosition": true }'
                style="
                margin-right: 0px;
                margin-left: 0px;
                padding: 0px;
                padding-left: 10px;
                padding-right: 10px;
                "
                >
                <!-- Start: 1 -->
                 <%
                            while(rs.next()) {
                    %>
                <div class="col-sm-6 col-lg-4 mb-4">
                    <!-- Start: card -->
                    <div
                        class="card"
                        style="
                        background: rgb(33, 37, 41);
                        border-style: none;
                        box-shadow: 0px 0px 15px 3px #ffffff08;
                        "
                        >
                        <picture type="" srcset=""
                                 ><img src="assetsadmin/img/food/<%=rs.getString("Image")%>" class="img-thumbnail" alt="Food_image"
                                style="
                                border-radius: 20px;
                                object-fit: cover;
                                padding-bottom: 5px;
                                margin-bottom: -11px;
                                " /></picture
                        >
                        <br><!-- Start: texto -->
                        <div
                            class="card-body"
                            style="padding-top: 0px; padding-bottom: 16px; text-align: center"
                            >
                            <h5
                                class="card-title"
                                style="margin-bottom: 0px; color: rgb(255, 255, 255)"
                                >
                                <% out.print(rs.getString("Name"));  %>
                            </h5>
                            <p
                                class="card-text text-muted"
                                style="margin-bottom: 0px; color: rgb(108, 117, 125)"
                                >
                                <span style="color: rgb(159, 169, 179)">Rs.<% out.print(rs.getString("Price"));  %></span>
                            </p>
                            <div
                                class="btn-group"
                                role="group"
                                style="padding-top: 6px; border-style: none"
                                >
                                <a href="PlaceOrder.jsp"><button class="btn btn-primary btn-d" role="button"  >
                                    <strong>Buy Now</strong></button
                                    ></a>
                                <a href="PlaceOrder.jsp"><button class="btn btn-primary btn-d" role="button">
                                    <i class="fa fa-cart-plus" style="color: rgb(33, 37, 41)"></i>
                                    </button></a>
                            </div>
                        </div>
                        <!-- End: texto -->
                    </div>
                    <!-- End: card -->
                </div>
                <% } %>
            </div>
            <!-- End: cards -->
        </div>
        <!-- End: Masonry gallery cards responsive --><!-- Start: footer -->
        <div>
            <!-- Start: Footer Dark -->
            <footer class="text-center bg-dark">
                <div class="container text-white py-4 py-lg-5">
                    <ul class="list-inline" style="margin-bottom: 6px">
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#"
                               >spicyandtasterestaurant@gmail.com</a
                            >
                        </li>
                        <li class="list-inline-item me-4">
                            <a class="link-light" href="#">+94 76 234 6356</a>
                        </li>
                    </ul>
                    <div><img src="assets/img/Logo.png" style="max-width: 170px" /></div>
                    <p class="text-muted mb-0">
                        Copyright © 2023 Spicy &amp; Taste Restaurant
                    </p>
                </div>
            </footer>
            <!-- End: Footer Dark -->
        </div>
        <!-- End: footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

