package com.auto.bo;

import com.auto.dao.AutoMartDAO;


/**
 * 
 * @author manju
 *
 */
public class Vehicle 
{

	/**
	 * Enters the Vehicle info in database table
	 * @param object of Vehicle Info class
	 * @return boolean flag indicating success or failure 
	 */
	public boolean createVehicleInfo(Vehicle_Info vInfo)
	{
		System.out.println("BO: Entering createVehicleInfo function ");
		boolean isVehicleInfoCreated = false;
		AutoMartDAO autoMart = new AutoMartDAO();
		
		if (vInfo!=null)
		{
			isVehicleInfoCreated = autoMart.createVehicleInfo(vInfo);
		}

		System.out.println("BO: Exiting createVehicleInfo function isVehicleInfoCreated="+isVehicleInfoCreated);

		return isVehicleInfoCreated;
	}

	
	
	
	
	/**
	 * Returns the list of saved vehicles
	 * @return Vehicle Info array
	 */
	public Vehicle_Info[] getSavedVehicles()
	{
		System.out.println("BO: Entering getSavedVehicles function ");
		Vehicle_Info[] vInfo_list;
		AutoMartDAO autoMart = new AutoMartDAO();
		
		vInfo_list = autoMart.getSavedVehicles();

		System.out.println("BO: Exiting getSavedVehicles function ");

		return vInfo_list;
	}
}
