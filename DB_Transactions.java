//example program for transaction management in java
import java.io.*;
import java.util.*;
import java.sql.*;

class DB_Transactions {
    public static void main(String args[]) {
        Connection con = null;
        Statement st = null;
        int no;
        String name;
        Float sal;
        Scanner s = new Scanner(System.in);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems_db?CharacterEncoding=utf8", "root", "");
            con.setAutoCommit(false); 
            st = con.createStatement();
            System.out.println("Enter no, name, and salary");
            no = s.nextInt();
            s.nextLine(); 
            name = s.nextLine();
            sal = s.nextFloat();
            String str = "insert into emp values(";
            str = str + no + ",'";
            str = str + name + "',";
            str = str + sal + ")";
            System.out.println(str);
            int rowsAffected = st.executeUpdate(str);
            System.out.println(rowsAffected + " record(s) inserted");
             
            con.commit();//method to save the transaction
        } catch (Exception e) {
            try {
            
                if (con != null) {
                    con.rollback();//method in transaction
                }
            } catch (SQLException ex) {
                System.out.println("Error rolling back transaction: " + ex.getMessage());
            }
            System.out.println("Error: " + e.getMessage());
        }
    }
}
