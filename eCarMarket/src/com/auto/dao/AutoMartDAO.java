package com.auto.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.auto.bo.Vehicle_Info;

public class AutoMartDAO {
	
	public AutoMartDAO() {
		
	}

	/**
	 * private method creates the DB connection
	 * @return the dbConnection
	 */
	private Connection getDbConnection() {
		
		Connection dbConnection = null;
		
		try{  
			
			  Class.forName("oracle.jdbc.driver.OracleDriver");

			  dbConnection=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:xe","manju","manju");  
			  System.out.println("Connection Successful");
		}
		catch(Exception e){ 
			System.out.println("Error in creating connection "+e.getMessage());
		}
		
		return dbConnection;
	}

	/**
	 * private method closes the existing DB connection to release resources
	 * @param dbConnection
	 */
	private void closeDbConnection(Connection dbConnection) {
		
		try{  
			  if (dbConnection != null) {
				  dbConnection.close();
			  }
		}
		catch(Exception e){ 
			System.out.println("Error in closing connection "+e);
		}
	}

	/**
	 * method inserts the vehicle information in the database
	 * @param vInfo
	 * @return boolean flag true incase the information is successfully inserted or false 
	 */
	
	public boolean createVehicleInfo(Vehicle_Info vInfo)
	{
		System.out.println("DAO: Entering createVehicleInfo function ");
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean success = false;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				
				String sqlQuery = "insert into USER_VEHICLE_INFO"
						+ "(RECIEPTNO,S_NAME,ADDRESS,CITY"
						+ ",PROVINCE,POSTALCODE ,PHONENO"
						+ ",EMAIL,V_MAKE,V_MODEL,V_YEAR,KILOMETERS"
						+ ",FEATURES,OWNERSHIP) values "
						+ "(SUPPLIER_INFO_seq.NEXTVAL,"
						+ "'"+vInfo.getSellerName()+"', "
						+ "'"+vInfo.getAddress()+"',"
						+ "'"+vInfo.getCity()+"',"
						+ "'"+vInfo.getProvince()+"',"
						+ "'"+vInfo.getPostalCode()+"',"
						+ "'"+vInfo.getPhone()+"',"
						+ "'"+vInfo.getEMail()+"',"
						+ "'"+vInfo.getVMake()+"',"
						+ "'"+vInfo.getV_model()+"',"
						+ "'"+vInfo.getVYear()+"',"
						+ "'"+vInfo.getVKM()+"',"
						+ "'"+vInfo.getVFeatures()+"',"
						+ "'"+vInfo.getVOwnership()+"')";
				
				System.out.println("Create Vehicle Query = "+sqlQuery);
				
				dbStmt.execute(sqlQuery);

				success = true;
				System.out.println("DAO: createVehicleInfo created ");
				

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in createVehicleInfo function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting createVehicleInfo function success="+success);
		
		return success;
	}

	
	/**
	 * method to get all saved vehicle information from Database
	 * @return Array of Vehicle_Info objects 
	 */
	public Vehicle_Info[] getSavedVehicles()
	{
		System.out.println("DAO: Entering getSavedVehicles function ");
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		Vehicle_Info[] vInfo = null;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
				String sqlQuery = "select V_MAKE,V_MODEL,V_YEAR,KILOMETERS,FEATURES,"
						+ "OWNERSHIP,S_NAME,ADDRESS,CITY,PROVINCE,POSTALCODE ,PHONENO,"
						+ "EMAIL from  USER_VEHICLE_INFO";
						
				System.out.println("Search Vehicle Query = "+sqlQuery);
				
				dbResult=dbStmt.executeQuery(sqlQuery);
				
				if (dbResult != null)
				{
					dbResult.last();
					int len = dbResult.getRow();
					System.out.println("No of records returned :"+len);
					dbResult.beforeFirst();
					
					vInfo = new Vehicle_Info[len];
					int counter = 0;
					
					while(dbResult.next()) 
					{
						vInfo[counter] = new Vehicle_Info();
						vInfo[counter].setVMake(dbResult.getString(1));
						vInfo[counter].setV_model(dbResult.getString(2));
						vInfo[counter].setVYear(dbResult.getString(3));
						vInfo[counter].setVKM(dbResult.getString(4));
						vInfo[counter].setVFeatures(dbResult.getString(5));
						vInfo[counter].setVOwnership(dbResult.getString(6));
						vInfo[counter].setSellerName(dbResult.getString(7));
						vInfo[counter].setAddress(dbResult.getString(8));
						vInfo[counter].setCity(dbResult.getString(9));
						vInfo[counter].setProvince(dbResult.getString(10));
						vInfo[counter].setPostalCode(dbResult.getString(11));
						vInfo[counter].setPhone(dbResult.getString(12));
						vInfo[counter].setEMail(dbResult.getString(13));
						counter++;
					}
				}	
				
				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in getSavedVehicles function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting getSavedVehicles function ");
		
		return vInfo;
	}

}
