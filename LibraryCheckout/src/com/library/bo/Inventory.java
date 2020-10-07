package com.library.bo;

import com.library.dao.LibraryDAO;

/**
 * 
 */
public class Inventory {

	/**
	 * 
	 */
	public Inventory() {
	}
	
	/**
	 * 
	 */
	public boolean createInventory(Item item)
	{
		System.out.println("BO: Entering createInventory function Item="+item);
		boolean isItemCreated = false;
		LibraryDAO library = new LibraryDAO();
		
		if (item!=null)
		{
			isItemCreated = library.createItem(item);
		}

		System.out.println("BO: Exiting createInventory function isItemCreated="+isItemCreated);
		
		return isItemCreated;
	}

	/**
	 * 
	 */
	public Item getInventoryItem(int itemId)
	{
		System.out.println("BO: Entering getInventoryItem function Item="+itemId);
		Item item = null;
		
		
		LibraryDAO library = new LibraryDAO();
		
		item = library.getInventoryItem(itemId);

		System.out.println("BO: Exiting getInventoryItem function ");
		
		return item;
	}
	
	/**
	 * 
	 */
	public Item[] searchItem(String searchString)
	{
		System.out.println("BO: Entering searchItem function searchString="+searchString);
		
		Item[] items = null;
		LibraryDAO library = new LibraryDAO();

		items = library.searchItem(searchString);

		System.out.println("BO: Exiting searchItem function ");

		return items;
		
	}

	/**
	 * 
	 */
	public Item[] searchAdvance(String title, String author, String subject)
	{
		System.out.println("BO: Entering searchAdvance function ");
		
		Item[] items = null;
		
		LibraryDAO library = new LibraryDAO();

		items = library.searchAdvance(title, author, subject);

		System.out.println("BO: Exiting searchAdvance function ");

		return items;
		
	}


}
