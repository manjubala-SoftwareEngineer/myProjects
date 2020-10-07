package com.library.bo;

import java.util.Date;

/**
 * 
 *
 */
public class ItemTrans {

	private int transId=0;
	private int itemId=0;
	private String itemTitle="";
	private String itemCategory="";
	
	private int userId=0;
	private String userName="";
	
	private Date checkoutDate;
	private Date dueDate;
	private Date returnDate;
	private String status="";
	private double lateFee=0.0;
	
	
	/**
	 * 
	 */
	public ItemTrans() {
	}

	public int getTransId() {
		return transId;
	}


	public void setTransId(int transId) {
		this.transId = transId;
	}


	public int getItemId() {
		return itemId;
	}


	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public Date getCheckoutDate() {
		return checkoutDate;
	}


	public void setCheckoutDate(Date checkoutDate) {
		this.checkoutDate = checkoutDate;
	}


	public Date getDueDate() {
		return dueDate;
	}


	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}


	public Date getReturnDate() {
		return returnDate;
	}


	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public double getLateFee() {
		return lateFee;
	}


	public void setLateFee(double lateFee) {
		this.lateFee = lateFee;
	}




	public String toString()
	{
		String objItemStr = null;
		
		objItemStr = this.transId+" "+this.itemId+" "+this.userId+" "+this.checkoutDate+" "+this.dueDate+" "+this.returnDate+" "+this.status+" "+this.lateFee;
		
		return objItemStr;
	}

	/**
	 * @return the itemTitle
	 */
	public String getItemTitle() {
		return itemTitle;
	}

	/**
	 * @param itemTitle the itemTitle to set
	 */
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the itemCategory
	 */
	public String getItemCategory() {
		return itemCategory;
	}

	/**
	 * @param itemCategory the itemCategory to set
	 */
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	
}
