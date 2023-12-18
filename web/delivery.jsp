<%-- 
    Document   : delivery
    Created on : Jul 30, 2023, 11:16:55 AM
    Author     : DELL
--%>

<%@page import="app.classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <title>Delivery Staff</title>
        <link rel="stylesheet" href="assetsadmin/bootstrap/css/bootstrap.min.css" />

        <style>
            #table {
                min-height: 66.1vh;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md  py-3" style="background-color: #212529;">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="assets/img/Logo.png" class="img-fluid bg-dark" alt="..." width="210" height="65.4">
                </a>
                <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-5">
                    <span class="visually-hidden">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-5">
                    <ul class="navbar-nav ms-auto"></ul>
                    <span class="text-light d-none d-sm-block">Hello Delivery Staff!</span>
                    <a class="btn ms-md-2 fw-bold" role="button" href="index.jsp" style="background-color: #FB6A11;">Log Out</a>
                </div>
            </div>
        </nav>
        <br />
        <br> <br>
        <div class="container " id="table">
            <div class="table-responsive">
                <table class="table ">
                    <thead>
                        <tr>
                            <th class="fs-3">Order ID</th>
                            <th class="fs-3">Name</th>
                            <th class="fs-3">Address</th>
                            <th class="fs-3">Telephone</th>
                            <th class="fs-3">Total Bill</th>
                            <th class="fs-3">Action</th>
                            <th class="fs-3">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                          <%
                            Connection con = DBConnector.getConnection();
                            String query = "SELECT * FROM Delivery, User_Detail WHERE Delivery.User_ID = User_Detail.User_ID;";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(query);

                            while (rs.next()) {
                                String Delivery_ID = rs.getString("Delivery_ID");
                                String Order_ID = rs.getString("Order_ID");

                                PreparedStatement pst = con.prepareStatement("SELECT Total_Bill FROM rad.Order WHERE Order_ID = ?;");
                                pst.setString(1, Order_ID);
                                ResultSet rs1 = pst.executeQuery();
                                rs1.next();
                        %>
                        <tr>
                            <td><%=rs.getString("Order_ID")%></td>
                            <td><%=rs.getString("Name")%></td>
                            <td><%=rs.getString("Address")%></td>
                            <td><%=rs.getString("Telephone")%></td>
                            <td><%=rs1.getString("Total_Bill")%></td>
                            <td>
                                <a href="update_delivery.jsp?Delivery_ID=<%=Delivery_ID%>">
                                    <button class="btn btn-success" type="submit" name="delivered">Delivered</button>
                                </a>
                            </td>
                            <td class="text-danger fw-bold fst-italic"><%=rs.getString("Status")%></td>
                        </tr>  
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-md-6 align-self-center">
                        <p id="dataTable_info" class="dataTables_info fw-bold" role="status" aria-live="polite">Showing 1 to 05 of 20</p>
                    </div>
                    <div class="col-md-6">
                        <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <script src="assetsadmin/bootstrap/js/bootstrap.min.js"></script>

        <footer id="sticky-footer" class="flex-shrink-0 py-4 text-white-50" style="background-color: #212529">
            <div class="container text-light text-center h6">
                <span style="font-family: 'Times New Roman', Times, serif;">Copyright &copy; Spicy & Taste 2023</span>
            </div>
        </footer>
    </body>
</html>
