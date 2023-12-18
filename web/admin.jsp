<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="app.classes.DBConnector"%>
<%@page import="app.classes.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
    if (request.getParameter("add") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String hashText= MD5.getMd5(password);
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

        Connection con = DBConnector.getConnection();
        try {
            PreparedStatement pstmt1 = con.prepareStatement("INSERT into User (Username, Password, Role) VALUES(?, ?, ?);");
            pstmt1.setString(1, username);
            pstmt1.setString(2, hashText);
            pstmt1.setString(3, "Guest");
            int a1 = pstmt1.executeUpdate();

            if (a1 > 0) {
                PreparedStatement pstmt2 = con.prepareStatement("SELECT User_ID FROM User WHERE Username = ?;");
                pstmt2.setString(1, username);
                ResultSet rs = pstmt2.executeQuery();

                if (rs.next()) {
                    String userId = rs.getString("User_ID");
                    PreparedStatement pstmt3 = con.prepareStatement("INSERT into User_Detail (User_ID, Name, Telephone, Email) VALUES(?, ?, ?, ?)");
                    pstmt3.setString(1, userId);
                    pstmt3.setString(2, name);
                    pstmt3.setString(3, tel);
                    pstmt3.setString(4, email);
                    pstmt3.executeUpdate();
                } else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'admin.jsp';
</script>
<%
    }
} else {
%>
<script LANGUAGE='JavaScript'>
    window.alert('An error occured!')
    window.location.href = 'admin.jsp';
</script>
<%
        }
    } catch (Exception ex) {
        Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
    }
%>
<script LANGUAGE='JavaScript'>
    window.alert('Record Added Successfully!')
    window.location.href = 'admin.jsp';
</script>

<%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Admin Panel</title>
        <link rel="stylesheet" href="assetsadmin/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assetsadmin/css/Navbar-Centered-Brand-icons.css">
        <style>
            #table {
                min-height: 67vh;
            }
        </style>
    </head>
    <body>
        <div id="main">
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

                        <span class="text-light d-none d-sm-block"></i>Hello Admin!</span>

                        <a class="btn ms-md-2 fw-bold" role="button" href="index.jsp" style="background-color: #FB6A11;">Log Out</a>
                    </div>
                </div>
            </nav>
            <br>
            <div class="container text-end">
                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        style="background-color: #FB6A11;">
                    <strong>Add User</strong>
                </button>
            </div>
            <form action="#" method="POST">
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title h3" id="exampleModalLabel">Add User</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-light" style="background-color: #212529;">
                                <div class="form-outline form-white h5">
                                    <label class="form-label h5" for="name">Name</label>
                                    <br />
                                    <input type="text" class="form-control" name="name" id="name" required />
                                    <br />
                                    <label class="form-label h5" for="tel">Telephone</label>
                                    <br />
                                    <input type="text" class="form-control" name="tel" id="tel" required />
                                    <br />
                                    <label class="form-label h5" for="tel">Email</label>
                                    <br />
                                    <input type="text" class="form-control" name="email" id="email" required />
                                    <br />
                                    <label class="form-label h5" for="tel">Username</label>
                                    <br />
                                    <input type="text" class="form-control" name="username" id="username" required />
                                    <br />
                                    <label class="form-label h5" for="tel">Password</label>
                                    <br />
                                    <input type="text" class="form-control" name="password" id="password" required />
                                    <br />
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
                    <table class="table" id="tbl_admin">
                        <thead>
                            <tr>
                                <th class="fs-3">Name</th>
                                <th class="fs-3">Telephone</th>
                                <th class="fs-3">Email</th>
                                <th class="fs-3">Username</th>
                                <th class="fs-3">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                Connection con = DBConnector.getConnection();
                                String query = "SELECT * FROM User,User_Detail WHERE User.User_id=User_Detail.User_Id";
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String User_ID = rs.getString("User_ID");
                            %>
                            <tr>
                                <td><%=rs.getString("Name")%></td>
                                <td><%=rs.getString("Telephone")%></td>
                                <td><%=rs.getString("Email")%></td>
                                <td><%=rs.getString("Username")%></td>
                                <td>
                                    <a href="delete_admin.jsp?User_ID=<%=User_ID%>">
                                        <button class="btn btn-danger" type="submit" name="delete">Delete</button>
                                    </a>
                                </td>
                            </tr>
                            <%                                }

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
                                    <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span
                                                aria-hidden="true">«</span></a></li>
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
        </div>
        <script src="assetsadmin/bootstrap/js/bootstrap.min.js"></script>
        <footer id="sticky-footer" class="flex-shrink-0 py-4 text-white-50" style="background-color: #212529">
            <div class="container text-light text-center h6">
                <span style="font-family: 'Times New Roman', Times, serif;">Copyright &copy; Spicy & Taste 2023</span>
            </div>
        </footer>
    </body>
</html>
