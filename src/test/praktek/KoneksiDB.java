package test.praktek;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class KoneksiDB {
    Connection connection;
    Statement statement;
    PreparedStatement preparedstatement;
    ResultSet result;
    String query;
    
    void setConnect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("ERROR" + ex);
        }
        
        String local = "jdbc:mysql://localhost:3306/db_test";
        
        try {
            connection = DriverManager.getConnection(local, "root", "");
        } catch (SQLException ex) {
            System.out.println("ERROR" + ex);
        }
    }
    
    void getData(){
        try {
            setConnect();
            statement = connection.createStatement();
            result = statement.executeQuery(query);
        } catch (SQLException ex) {
            System.out.println("ERROR" + ex);
        }
    }
    
    void setData(){
        try {
            setConnect();
            preparedstatement = connection.prepareStatement(query);
        } catch (SQLException ex) {
            System.out.println("ERROR" + ex);
        }
        
    }
    
}
