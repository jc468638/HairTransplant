package com.htransplant.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.htransplant.beans.Attachment;
import com.htransplant.beans.Enquiry;
import com.htransplant.beans.HairPackage;
import com.htransplant.beans.User;




public class ApplicationDao {

    public List<HairPackage> ListHairPackages() {
        HairPackage hairPackage = null;
        List<HairPackage> hairpackages = new ArrayList<>();

        try{
            Connection connection = DBConnection.getConnectionToDatabase();

            String sql = "select * from package where packageStatus = 'AC'";

            Statement statement = connection.createStatement();

            ResultSet set = statement.executeQuery(sql);

            while(set.next()){
                hairPackage= new HairPackage(); //creating object HairPackage
                hairPackage.setPackageId(set.getInt("packageId"));
                hairPackage.setPackageName(set.getString("packageName"));
                hairPackage.setPackageDescription(set.getString("packageDescription"));
                hairPackage.setPackagePrice(set.getInt("packagePrice"));
                hairPackage.setPackageImgPath(set.getString("packageImgPath"));
                hairpackages.add(hairPackage);

            }
        }
        catch(SQLException exception){
            exception.printStackTrace();
        }
        return hairpackages;
    }

    public int registerUser(User user){
        int rowsAffected = 0;
        try{
            //get connection to the database
            Connection connection = DBConnection.getConnectionToDatabase();

            //write the insert query
            String insertQuery = "INSERT INTO user(userName,userFirstName,userLastName,userPassword,roleId) VALUES(?,?,?,?,?);";

            //set parameters with prepare statement
            java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
            statement.setString(1,user.getUserName());
            statement.setString(2,user.getUserFirstName());
            statement.setString(3,user.getUserLastName());
            statement.setString(4,user.getUserPassword());
            statement.setInt(5,2);

            //execute statement

            rowsAffected = statement.executeUpdate();

        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return  rowsAffected;
    }

    public boolean validateUser(String username, String password) {
        boolean isValidUser=false;
        try{
            //get the connection to the database
            Connection connection = DBConnection.getConnectionToDatabase();

            //write the select query
            String sql = "select * from user where userName=? and userPassword=?";

            //prepare statement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,username);
            statement.setString(2,password);

            //execute statement
            ResultSet set = statement.executeQuery();

            while (set.next()){
                isValidUser = true;
            }


        }
        catch (SQLException exception){
            exception.printStackTrace();
        }
        return isValidUser;
    }

    public User getProfileDetails(String username){
        User user = null;
        try{
            //get connection to the database
            Connection connection = DBConnection.getConnectionToDatabase();

            //write select query to get profile details
            String sql = "SELECT userName,userFirstName,userLastName FROM h_transplant.user where userName=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,username);

            //execute query, get resultset and return User info
            ResultSet set = statement.executeQuery();
            while (set.next()){
                user = new User();
                user.setUserName(set.getString("username"));
                user.setUserFirstName(set.getString("userFirstName"));
                user.setUserLastName(set.getString("userLastName"));

            }


        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return user;
    }

    public int addEnquiry(Enquiry enquiry){
        int rowsAffected = 0;
        try{
            //get connection to the database
            Connection connection = DBConnection.getConnectionToDatabase();

            //write the insert query
            String insertQuery = "INSERT INTO enquiry(enquiry_ref,user_email,user_name,user_last_name,user_phone, user_sex, user_weight,enquiry_title, enquiry_message  ) VALUES(?,?,?,?,?,?,?,?,?);";

            //set parameters with prepare statement
            java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
            statement.setInt(1, enquiry.getEnquiryRef());
            statement.setString(2,enquiry.getUserEmail());
            statement.setString(3,enquiry.getUserName());
            statement.setString(4,enquiry.getUserLastName());
            statement.setString(5,enquiry.getUserPhone());
            statement.setInt(6,enquiry.getUserSex());
            statement.setInt(7,enquiry.getUserWeight());
            statement.setString(8,enquiry.getEnquiryTitle());
            statement.setString(9,enquiry.getEnquiryMessage());

            //execute statement

            rowsAffected = statement.executeUpdate();

        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return  rowsAffected;
    }

    public int addAttachment(Attachment attachment){
        int rowsAffected = 0;
        try{
            //get connection to the database
            Connection connection = DBConnection.getConnectionToDatabase();

            //write the insert query
            String insertQuery = "INSERT INTO attachment(attch_type,attch_type_id,attch_file,attach_name) VALUES(?,?,?,?);";

            //set parameters with prepare statement
            java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
            statement.setInt(1, attachment.getAttch_type());
            statement.setInt(2, attachment.getAttch_type_id());
            statement.setBlob(3,attachment.getAttch_file());
            statement.setString(4,attachment.getAttach_name());


            //execute statement

            rowsAffected = statement.executeUpdate();

        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return  rowsAffected;
    }

}