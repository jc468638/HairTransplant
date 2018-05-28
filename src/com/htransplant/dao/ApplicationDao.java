package com.htransplant.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
               // hairPackage.setPackageImgPath(set.getString("packageI"));
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

}