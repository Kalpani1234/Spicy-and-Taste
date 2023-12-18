<%@page import="app.classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <title>Owner</title>
        <link rel="stylesheet" href="assetsadmin/bootstrap/css/bootstrap.min.css" />

        <style>
            #table {
                min-height: 67.5vh;
            }
            header{
                font-family: "Times New Roman", Times, serif;
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
                    <span class="text-light d-none d-sm-block">Hello Owner!</span>
                    <a class="btn ms-md-2 fw-bold" role="button" href="index.jsp" style="background-color: #FB6A11;">Log Out</a>
                </div>
            </div>
        </nav>
        <br>
        <div class="container text-end">
            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #FB6A11;">
                <strong>Add Food</strong>
            </button>
        </div>
        <form action="AddImage" method="POST" enctype="multipart/form-data">
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title h3" id="exampleModalLabel">Add Food</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-light" style="background-color: #212529;">
                            <div class="form-outline form-white h5">
                                <label class="form-label h5" for="foodName">Food Name</label>
                                <br />
                                <input type="text" class="form-control" name="foodName" id="foodName" required />
                                <br />
                                <label class="form-label h5" for="foodprice">Food Price</label>
                                <br />
                                <input type="number" class="form-control" name="foodPrice" id="foodPrice" required />
                                <br />
                                <div class="custom-file">
                                    <label class="custom-file-label" for="customFile">Select Image</label>
                                    <input type="file" class="form-control custom-file-input" id="customFile" name="image" required/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" name="close" id="close" class="btn text-light" data-bs-dismiss="modal" style="background-color: #212529;">Close</button>
                            <button type="submit" name="add" id="add" class="btn fw-bold" style="background-color: #FB6A11;">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="container" id="table">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="fs-3">Food ID</th>
                            <th class="fs-3">Name</th>
                            <th class="fs-3">Price</th>
                            <th class="fs-3">Image</th>
                            <th class="fs-3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection con = DBConnector.getConnection();
                            String query = "SELECT * FROM food";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(query);

                            while (rs.next()) {
                                String Food_ID = rs.getString("Food_ID");
                        %>
                        <tr>
                            <td><%=rs.getString("Food_ID")%></</td>
                            <td><%=rs.getString("Name")%></td>
                            <td><%=rs.getString("Price")%></td>
                            <td>
                                <img src="assetsadmin/img/food/<%=rs.getString("Image")%>" class="img-thumbnail" alt="Food_image" width="100" height="100">
                            </td>
                            <td>
                                <a href="delete_owner.jsp?Food_ID=<%=Food_ID%>"
                                   <button class="btn btn-danger" type="submit" name="delete">Delete</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-md-6 align-self-center">
                        <p id="dataTable_info" class="dataTables_info fw-bold" role="status" aria-live="polite">Showing 1 to 05
                            of 20</p>
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