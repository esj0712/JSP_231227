package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class MemberDAO {
   
   String url ="jdbc:oracle:thin:@localhost:1521:xe";
   String user="system";
   String pass="12345";
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   
   public void getCon() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection(url,user,pass);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   //Insert into
   public void insertMember(MemberDBBean mbean) {
      
      try {
         getCon();
         String sql="insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
         PreparedStatement pstmt=con.prepareStatement(sql);
         
         pstmt.setString(1, mbean.getId());
         pstmt.setString(2, mbean.getPass1());
         pstmt.setString(3, mbean.getPass2());
         pstmt.setString(4, mbean.getEmail());
         pstmt.setString(5, mbean.getGender());
         pstmt.setString(6, mbean.getAddress());
         pstmt.setString(7, mbean.getPhone());
         pstmt.setString(8, mbean.getHobby());
         pstmt.setString(9, mbean.getJob());
         pstmt.setString(10, mbean.getAge());
         pstmt.setString(11, mbean.getInfo());
      
         pstmt.executeUpdate();
      
         con.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   //select================================================
   public Vector<MemberDBBean> allSelectMember() {
         //동기화
      Vector<MemberDBBean> v=new Vector<MemberDBBean>();
      try {
         //DB연결 (method 이용)
         getCon();
         //sql 쿼리의 String
         String sql="select id, pass1, pass2, email, gender, address, phone, hobby, job, age, info from member";
         //실행
         pstmt=con.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            MemberDBBean bean=new MemberDBBean();
            bean.setId(rs.getString(1));
            bean.setPass1(rs.getString(2));
            bean.setPass2(rs.getString(3));
            bean.setEmail(rs.getString(4));
            bean.setGender(rs.getString(5));
            bean.setAddress(rs.getString(6));
            bean.setPhone(rs.getString(7));
            bean.setHobby(rs.getString(8));
            bean.setJob(rs.getString(9));
            bean.setAge(rs.getString(10));
            bean.setInfo(rs.getString(11));
            
            v.add(bean);
               
         }
         con.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return v;
   }
   //selectAll 끗====================================================

   //select * from member where id = ?
   public MemberDBBean oneselectMember(String id ) {
      MemberDBBean bean=new MemberDBBean();
      
      try {
         getCon();
         String sql="select * from member where id =? ";
         pstmt=con.prepareStatement(sql);
         //? 매핑
         pstmt.setString(1,id);
         rs=pstmt.executeQuery();
         while(rs.next()) {
            
            bean.setId(rs.getString(1));
            bean.setPass1(rs.getString(2));
            bean.setPass2(rs.getString(3));
            bean.setEmail(rs.getString(4));
            bean.setGender(rs.getString(5));
            bean.setAddress(rs.getString(6));
            bean.setPhone(rs.getString(7));
            bean.setHobby(rs.getString(8));
            bean.setJob(rs.getString(9));
            bean.setAge(rs.getString(10));
            bean.setInfo(rs.getString(11));
         }
         con.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bean;
   }
//oneSelectMember==========================================   
   
   //select pass1 from member where id=?
public String getPass(String id) {
   
   String pass="";

   
   try {
      getCon();
      String sql="select pass1 from member where id=?";
      pstmt=con.prepareStatement(sql);
      //? 매핑
      pstmt.setString(1,id);
      rs=pstmt.executeQuery();
         if(rs.next()) {
            pass=rs.getString(1);
         }
         con.close();
   } catch (Exception e) {
      e.printStackTrace();
   }
   
   return pass;
   
}

//getPass====================================================

//update member set email=?, phone=? where id=?
public void UpdateMember(MemberDBBean bean) {
   
	try {
      getCon();
      
      String sql="update member set email=?, phone=? where id=?";
      pstmt=con.prepareStatement(sql);
      pstmt.setString(1, bean.getEmail());
      pstmt.setString(2, bean.getPhone());
      pstmt.setString(3, bean.getId());
      
      pstmt.executeUpdate();
      con.close();
   } catch (Exception e) {
      e.printStackTrace();
   }
   
}

//========================================
//delete from member where id=?
public void deleteMember(String id) {
   try {
      getCon();
      
      String sql="delete from member where id=?";
      pstmt=con.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.executeUpdate();
      con.close();
      
            
   } catch (Exception e) {
      e.printStackTrace();
   }
}
}