/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.sql.*;
import app.classes.DBConnector;

/**
 *
 * @author TUF
 */
public class User {
    
    DBConnector dbcon = new DBConnector();
    
        public ResultSet getOrderDeailsByOrderID(int id) throws ClassNotFoundException, SQLException{
        Connection con = dbcon.getConnection();
        String query = "SELECT u.Name, u.Telephone, o.Total_Bill,o.Date, d.Address, d.Status FROM user_detail u JOIN `order` o ON u.User_ID = o.User_ID"
                + " JOIN delivery d ON u.User_ID = d.User_ID AND o.Order_ID = d.Order_ID WHERE o.User_ID=? ORDER BY o.Date DESC";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }
    
}
