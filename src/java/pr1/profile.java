/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pr1;

import java.sql.PreparedStatement;

/**
 *
 * @author Riya Arora
 */
public class profile {
                 String txtname="";
    String txtedu="";
    int cityname=0;
    String mail="";
    String pass="";

    public String getTxtname() {
        return txtname;
    }

    public void setTxtname(String txtname) {
        this.txtname = txtname;
    }

    public String getTxtedu() {
        return txtedu;
    }

    public void setTxtedu(String txtedu) {
        this.txtedu = txtedu;
    }

    public int getCityname() {
        return cityname;
    }

    public void setCityname(int cityname) {
        this.cityname = cityname;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

 public  void insert() throws Exception
{
             String sql="Insert into profile(name,education,email,password,city)values(?,?,?,?,?)";
             try
             {
            PreparedStatement p=(Jdbcpro.getConnection()).prepareStatement(sql); 
            p.setString(1,this.txtname);
            p.setString(2,this.txtedu);
            p.setString(3,this.mail);
            p.setString(4,this.pass);
            p.setInt(5,this.cityname);
            Jdbcpro.insert(p);
             }
             catch(Exception e)
             {
                 throw e;
             }
}

}
