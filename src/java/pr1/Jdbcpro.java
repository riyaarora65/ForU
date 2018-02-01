/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/
package pr1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Jdbcpro{
    public Jdbcpro(){}
    
    public static Connection getConnection() 
    {
          String url = "jdbc:mysql://localhost:3306/";
          String dbName = "foru";
          String driver = "com.mysql.jdbc.Driver";
          String userName = "riya";
          String password = "forum";
          Connection conn = null;
          try {
          Class.forName(driver).newInstance();
          conn = DriverManager.getConnection(url+dbName,userName,password);
          } 
          catch (Exception e) 
          {
      		System.out.println("ERROR in getConnection : " + e);
        	  //e.printStackTrace();
          }
          return conn;
    }
	
	public static void insert(PreparedStatement p) throws SQLException
	{
		Connection conn = getConnection();
		try
                {
			p.executeUpdate();//we have generalized this
		
		}
		catch(Exception e)
		{
			System.out.println("ERROR Insert : " + e);
		}
                p.close();
	}
	
	public static ResultSet get(Connection conn,String sql)
        //public static ResultSet get(String sql)
	{
		 conn = getConnection();
		ResultSet rs=null;
		try{
			
			PreparedStatement p = conn.prepareStatement(sql);
		
			rs= p.executeQuery();
                    
                        
		
		}
		catch(Exception e)
		{
                    
			System.out.println("ERROR Select : " + e);
		}
                return rs;
	}
        public static void update(PreparedStatement p) throws SQLException
        {
            Connection con = getConnection();
            try
            {
                p.executeUpdate();
            }
            catch(Exception e)
             {
                System.out.print("Error updating : " + e);    
                
                    }
            p.close();
        }
        public static void closeConnection(Connection con) throws SQLException
        {
            con.close();
        }
        
    
}
