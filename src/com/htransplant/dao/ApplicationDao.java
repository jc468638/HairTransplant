package com.htransplant.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.htransplant.beans.HairPackage;

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
                hairpackages.add(hairPackage);
            }
        }
        catch(SQLException exception){
            exception.printStackTrace();
        }
        return hairpackages;
    }

}