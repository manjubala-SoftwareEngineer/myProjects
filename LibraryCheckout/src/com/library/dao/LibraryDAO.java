package com.library.dao;

import java.sql.*;

import com.library.bo.Item;
import com.library.bo.ItemTrans;
import com.library.bo.User;

/**
 * LibraryDB class to connect to Oracle Database and
 * perform all DB operations
 */
 
public class LibraryDAO {
	
	public LibraryDAO() {
		
	}

	/**
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
	 * Closing the dbConnection
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
	 * 
	 * @param loginId
	 * @param password
	 * @return
	 */
	
	/*Function set the User Attributes by selecting respective data from table lib_user_profile on userid and password search*/ 
	public User authenticateUser(String loginId, String password) 
	{
		System.out.println("DAO: Entering authenticateUser function LoginId="+loginId);

		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		User user = null;
		
		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				String sql = "select USER_ID, LOGINID, FIRSTNAME, LASTNAME, PASSWORD, USER_TYPE,ADDRESS,CITY,STATE,POSTAL_CODE,PHONE,EMAIL  from lib_user_profile where lower(loginid)=lower('"+loginId+"') AND PASSWORD='"+password+"'";
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					while(dbResult.next()) {
						user = new User();
						user.setUserId(dbResult.getInt(1));
						user.setLoginId(dbResult.getString(2));
						user.setFirstName(dbResult.getString(3));
						user.setLastName(dbResult.getString(4));
						user.setPassword(dbResult.getString(5));
						user.setUserType(dbResult.getString(6));
						user.setAddress(dbResult.getString(7));
						user.setCity(dbResult.getString(8));
						user.setState(dbResult.getString(9));
						user.setPostalCode(dbResult.getString(10));
						user.setPhone(dbResult.getString(11));
						user.setEMail(dbResult.getString(12));
					}
				}
			}
				
				
			this.closeDbConnection(dbConnection);
		

		}
		catch(Exception e){ 
			System.out.println("Error in authenticateUser "+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		
		System.out.println("DAO: Exiting authenticateUser function user ="+user);

		return user;
	}
	
	/**
	 * 
	 * @param operation create 
	 * @param user User Object
	 * @return true if insert is success else false
	 */
	public boolean createUser(User user)
	{
		System.out.println("DAO: Entering createUser function User="+user.toString());
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean success = false;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				dbStmt.execute("insert into lib_user_profile(USER_ID, LOGINID, FIRSTNAME, LASTNAME, PASSWORD, USER_TYPE,ADDRESS,CITY,STATE,POSTAL_CODE,PHONE,EMAIL) values (USERID_SEQ.NEXTVAL, '"+user.getLoginId()+"',"
						+ "'"+user.getFirstName()+"', '"+user.getLastName()+"','"+user.getPassword()+"','"+user.getUserType()+"', '"+user.getAddress()+"','"+user.getCity()+"',"
								+ "'"+user.getState()+"','"+user.getPostalCode()+"',"+user.getPhone()+",'"+user.getEMail()+"')");

				success = true;
				System.out.println("DAO: createUser User created ");
				

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in createUser function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting createUser function success="+success);
		
		return success;
	}

	/**
	 * operation update 
	 * @param user User Object
	 * @return true if update is success else false
	 */
	public boolean updateUser(User user)
	{
		System.out.println("DAO: Entering updateUser function User ="+user.getLoginId());
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean success = false;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				dbStmt.execute("update lib_user_profile SET FIRSTNAME='"+user.getFirstName()+"', LASTNAME= '"+user.getLastName()+"', ADDRESS='"+user.getAddress()+"',CITY='"+user.getCity()+"',STATE='"+user.getState()+"',POSTAL_CODE='"+user.getPostalCode()+"',PHONE='"+user.getPhone()+"',EMAIL='"+user.getEMail()+"' where USER_ID='"+user.getUserId()+"'");

				success = true;
				System.out.println("DAO: updateUser User updated");
				

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in updateUser function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting updateUser function success="+success);
		
		return success;
	}

	/**
	 * operation change Password
	 * @param user User Object
	 * @return true if update is success else false
	 */
	public boolean changePassword(User user)
	{
		System.out.println("DAO: Entering changePassword function User ="+user.getLoginId());
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean success = false;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				dbStmt.execute("update lib_user_profile SET PASSWORD='"+user.getPassword()+"' where USER_ID='"+user.getUserId()+"'");

				success = true;
				System.out.println("DAO: changePassword updated");
				

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in changePassword function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting changePassword function success="+success);
		
		return success;
	}
	
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public User getUser(int userId) {
		
		System.out.println("DAO: Entering getUser function itemId ="+userId);
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		User user = null;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				String sql = "select USER_ID, LOGINID, FIRSTNAME, PASSWORD, USER_TYPE,ADDRESS,CITY,STATE,POSTAL_CODE,PHONE,EMAIL,LASTNAME  from lib_user_profile where user_id='"+userId+"'";
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					while(dbResult.next()) {
						user = new User();
						user.setUserId(dbResult.getInt(1));
						user.setLoginId(dbResult.getString(2));
						user.setFirstName(dbResult.getString(3));
						user.setPassword(dbResult.getString(4));
						user.setUserType(dbResult.getString(5));
						user.setAddress(dbResult.getString(6));
						user.setCity(dbResult.getString(7));
						user.setState(dbResult.getString(8));
						user.setPostalCode(dbResult.getString(9));
						user.setPhone(dbResult.getString(10));
						user.setEMail(dbResult.getString(11));
						user.setLastName(dbResult.getString(12));
					}
				}

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in getUser function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting getUser function ");
		
		return user;
	}

	/**
	 * 
	 * @param search
	 * @return Users object array
	 */
	public User[] searchUser(String search) 
	{
		System.out.println("DAO: Entering searchUser function searchString ="+search);
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		User[] users = null;
		String sql="";

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				if (!search.equalsIgnoreCase(""))
				{
					sql = "select USER_ID, LOGINID, FIRSTNAME, PASSWORD, USER_TYPE,ADDRESS,CITY,STATE,POSTAL_CODE,PHONE,EMAIL,LASTNAME  from lib_user_profile where lower(FIRSTNAME) LIKE lower('%"+search+"%') OR lower(LASTNAME) LIKE lower('%"+search+"%') OR lower(LOGINID) LIKE lower('%"+search+"%')";	
				}
				else
				{
					sql = "select USER_ID, LOGINID, FIRSTNAME, PASSWORD, USER_TYPE,ADDRESS,CITY,STATE,POSTAL_CODE,PHONE,EMAIL,LASTNAME from lib_user_profile";
				}
				
				System.out.println("Search USER SQL = "+sql);
				
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					dbResult.last();
					int len = dbResult.getRow();
					System.out.println("No of records returned :"+len);
					dbResult.beforeFirst();
					users = new User[len];
					int counter = 0;
					
					while(dbResult.next()) 
					{
						users[counter] = new User();
						users[counter].setUserId(dbResult.getInt(1));
						users[counter].setLoginId(dbResult.getString(2));
						users[counter].setFirstName(dbResult.getString(3));
						users[counter].setPassword(dbResult.getString(4));
						users[counter].setUserType(dbResult.getString(5));
						users[counter].setAddress(dbResult.getString(6));
						users[counter].setCity(dbResult.getString(7));
						users[counter].setState(dbResult.getString(8));
						users[counter].setPostalCode(dbResult.getString(9));
						users[counter].setPhone(dbResult.getString(10));
						users[counter].setEMail(dbResult.getString(11));
						users[counter].setLastName(dbResult.getString(12));
						counter++;
					}
				}

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in searchUser function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting searchUser function ");
		
		return users;
	}
	
	/**
	 * 
	 * @param operation
	 * @param item
	 * @return
	 */
	public boolean createItem(Item item)
	{
		System.out.println("DAO: Entering createItem function Item="+item.toString());
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean success = false;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				
				dbStmt.execute("insert into lib_item_inventory(CATEGORY_ID, CATEGORY, TITLE, AUTHOR, SUBJECT,YEAR,COPIES,STATUS) values (ITEMID_SEQ.NEXTVAL, '"+item.getCategory()+"',"
						+ "'"+item.getTitle()+"','"+item.getAuthor()+"','"+item.getSubject()+"', '"+item.getYear()+"','"+item.getCopies()+"',"
								+ "'AVAILABLE')");

				success = true;

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in createItem function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting createItem function success="+success);
		
		return success;
	}
	
	/**
	 * get list of all inventory Items 
	 * 
	 * @param search
	 * @return
	 */
	public Item[] searchItem(String  search) {
		
		System.out.println("DAO: Entering searchItem function Item Search String ="+search);
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		Item[] items = null;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				String sql = "";
				dbStmt = dbConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				if (!search.equalsIgnoreCase(""))
				{
					sql = "select * from lib_item_inventory where lower(TITLE) LIKE lower('%"+search+"%') OR lower(AUTHOR) LIKE lower('%"+search+"%') OR lower(SUBJECT) LIKE lower('%"+search+"%')";	
				}
				else
				{
					sql = "select * from lib_item_inventory";
				}
				
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					dbResult.last();
					int len = dbResult.getRow();
					System.out.println("No of records returned :"+len);
					dbResult.beforeFirst();
					items = new Item[len];
					int counter = 0;
					while(dbResult.next()) 
					{
						items[counter] = new Item();
						items[counter].setItemId(dbResult.getInt(1));
						items[counter].setCategory(dbResult.getString(2));
						items[counter].setTitle(dbResult.getString(3));
						items[counter].setAuthor(dbResult.getString(4));
						items[counter].setSubject(dbResult.getString(5));
						items[counter].setYear(dbResult.getInt(6));
						items[counter].setCopies(dbResult.getInt(7));
						items[counter].setStatus(dbResult.getString(8));
						counter++;
					}
				}

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in search function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting search function ");
		
		return items;
	}

	/**
	 * 
	 * @param title
	 * @param author
	 * @param subject
	 * @return
	 */
	public Item[] searchAdvance(String title, String author, String subject) {
		
		System.out.println("DAO: Entering searchAdvance function Item Search title="+title+" author="+author+" subject="+subject);
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		Item[] items = null;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				String sql=null;
				if (!title.trim().isEmpty() && !author.trim().isEmpty() && !subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(TITLE) LIKE lower('%"+title+"%') AND lower(AUTHOR) LIKE lower('%"+author+"%') AND lower(SUBJECT) LIKE lower('%"+subject+"%')";	
				}
				else if (title.trim().isEmpty() && !author.trim().isEmpty() && !subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(AUTHOR) LIKE lower('%"+author+"%') AND lower(SUBJECT) LIKE lower('%"+subject+"%')";	
				}
				else if (!title.trim().isEmpty() && author.trim().isEmpty() && !subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(TITLE) LIKE lower('%"+title+"%') AND lower(SUBJECT) LIKE lower('%"+subject+"%')";	
				}
				else if (!title.trim().isEmpty() && !author.trim().isEmpty() && subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(TITLE) LIKE lower('%"+title+"%') AND lower(AUTHOR) LIKE lower('%"+author+"%')";	
				}
				else if (title.trim().isEmpty() && author.trim().isEmpty() && !subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(SUBJECT) LIKE lower('%"+subject+"%')";	
				}
				else if (!title.trim().isEmpty() && author.trim().isEmpty() && subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(TITLE) LIKE lower('%"+title+"%')";	
				}
				else if (title.trim().isEmpty() && !author.trim().isEmpty() && subject.trim().isEmpty() )
				{
					sql = "select * from lib_item_inventory where lower(AUTHOR) LIKE lower('%"+author+"%')";	
				}
				else 
				{
					sql = "select * from lib_item_inventory";	
				}

				System.out.println("SQL Query = "+sql);
				
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					dbResult.last();
					int len = dbResult.getRow();
					System.out.println("No of records returned :"+len);
					dbResult.beforeFirst();
					items = new Item[len];
					int counter = 0;
					while(dbResult.next()) {
						items[counter] = new Item();
						items[counter].setItemId(dbResult.getInt(1));
						items[counter].setCategory(dbResult.getString(2));
						items[counter].setTitle(dbResult.getString(3));
						items[counter].setAuthor(dbResult.getString(4));
						items[counter].setSubject(dbResult.getString(5));
						items[counter].setYear(dbResult.getInt(6));
						items[counter].setCopies(dbResult.getInt(7));
						items[counter].setStatus(dbResult.getString(8));
						counter++;
					}
				}

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in searchAdvance function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting searchAdvance function ");
		
		return items;
	}
	

	/**
	 *
	 * @param userId
	 * @param item
	 * @return
	 */
	public boolean checkoutItem(User user, Item item)
	{
		System.out.println(
				"DAO: Entering checkoutItem function user Id =" + user.getUserId() + " item Id =" + item.getItemId());
		Connection dbConnection = null;
		Statement dbStmt = null;
		Statement dbStmt2 = null;
		boolean isCheckout = false;

		try 
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null) 
			{
				String sql = "";
				int existingCopy = item.getCopies();
				dbStmt = dbConnection.createStatement();
				dbStmt2 = dbConnection.createStatement();

				if (existingCopy >= 1) 
				{
					// decrease copies count in item inventory table
					sql = "update lib_item_inventory SET COPIES='" + (existingCopy - 1) + "',STATUS='ISSUED' where CATEGORY_ID='"
							+ item.getItemId() + "'";
					System.out.println("SQL for update " + sql);

					dbStmt.executeUpdate(sql);

					sql = "insert into lib_item_transaction(TRANS_ID, ITEM_ID, USER_ID, STATUS,RENEW_COUNT,LATE_FEE) values (TRANSID_SEQ.NEXTVAL,'"
							+ item.getItemId() + "','" + user.getUserId() + "','ISSUED', '0', '0')";
					System.out.println("SQL for insert " + sql);

					// insert record in transaction table
					dbStmt2.execute(sql);

					System.out.println("SQL executed");

					isCheckout = true;

				} 
				else 
				{
					// cannot checkout as no more existing copies
					System.out.println("cannot checkout as no more existing copies ");
					isCheckout = false;
				}

				this.closeDbConnection(dbConnection);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Error in checkout function" + e);
			if (dbConnection != null) 
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting checkout function ");

		return isCheckout;
	}
		
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public ItemTrans[] getCheckOutList(User user) {
		
		System.out.println("DAO: Entering getCheckOutList function userId ="+user.getUserId());
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		ItemTrans[] trans = null;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				String sql = "";
				dbStmt = dbConnection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				if (user.getUserType().equals("A"))
				{
					//Admin user, get list of all checkouts
					sql = "select a.TRANS_ID, a.ITEM_ID, b.TITLE, b.CATEGORY, a.USER_ID, c.LOGINID, a.ISSUE_DATE, a.DUE_DATE, a.RETURN_DATE, a.STATUS from lib_item_transaction a, lib_item_inventory b, lib_user_profile c where a.ITEM_ID=b.CATEGORY_ID AND a.USER_ID=c.USER_ID AND a.STATUS IN ('ISSUED', 'RENEWED')";
					
				}
				else
				{
					//get list specific to logged in library user
					sql = "select a.TRANS_ID, a.ITEM_ID, b.TITLE, b.CATEGORY, a.USER_ID, c.LOGINID, a.ISSUE_DATE, a.DUE_DATE, a.RETURN_DATE, a.STATUS from lib_item_transaction a, lib_item_inventory b, lib_user_profile c where a.ITEM_ID=b.CATEGORY_ID AND a.USER_ID=c.USER_ID AND a.STATUS IN ('ISSUED', 'RENEWED') AND a.USER_ID='"+user.getUserId()+"'";
					
				}
				
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					dbResult.last();
					int len = dbResult.getRow();
					System.out.println("No of records returned :"+len);
					dbResult.beforeFirst();
					trans = new ItemTrans[len];
					int counter = 0;
					while(dbResult.next()) {
						trans[counter] = new ItemTrans();
						trans[counter].setTransId(dbResult.getInt(1));
						trans[counter].setItemId(dbResult.getInt(2));
						trans[counter].setItemTitle(dbResult.getString(3));
						trans[counter].setItemCategory(dbResult.getString(4));
						trans[counter].setUserId(dbResult.getInt(5));
						trans[counter].setUserName(dbResult.getString(6));
						trans[counter].setCheckoutDate(dbResult.getDate(7));
						trans[counter].setDueDate(dbResult.getDate(8));
						trans[counter].setReturnDate(dbResult.getDate(9));
						trans[counter].setStatus(dbResult.getString(10));
						counter++;
					}
				}

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in getCheckOutList function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting getCheckOutList function ");
		
		return trans;
	}
	
	/**
	 * 
	 * @param itemId
	 * @return
	 */
	public Item getInventoryItem(int itemId) 
	{
		
		System.out.println("DAO: Entering getInventoryItem function itemId ="+itemId);
		Connection dbConnection = null;
		Statement dbStmt = null;
		ResultSet dbResult = null;
		Item item = null;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				String sql = "select * from lib_item_inventory where CATEGORY_ID='"+itemId+"'";
				dbResult = dbStmt.executeQuery(sql);

				if (dbResult != null)
				{
					while(dbResult.next()) 
					{
						item = new Item();
						item.setItemId(dbResult.getInt(1));
						item.setCategory(dbResult.getString(2));
						item.setTitle(dbResult.getString(3));
						item.setAuthor(dbResult.getString(4));
						item.setSubject(dbResult.getString(5));
						item.setYear(dbResult.getInt(6));
						item.setCopies(dbResult.getInt(7));
						item.setStatus(dbResult.getString(8));
					}
				}

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in getInventoryItem function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting getInventoryItem function ");
		
		return item;
	}
	
	/**
	 *
	 * @param userId
	 * @param itemId
	 * @return
	 */
	public boolean checkinItem(int userId, int itemId) 
	{
		System.out.println(
				"DAO: Entering checkinItem function user Id =" + userId + " item Id =" + itemId);
		Connection dbConnection = null;
		Statement dbStmt = null;
		Statement dbStmt2 = null;
		boolean isCheckin = false;

		try 
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null) 
			{
				String sql = "";
				
				dbStmt = dbConnection.createStatement();
				dbStmt2 = dbConnection.createStatement();

				// increase copies count in item inventory table
				sql = "update lib_item_inventory SET COPIES=(select COPIES+1 from lib_item_inventory where category_id="+itemId+"),STATUS='AVAILABLE' where CATEGORY_ID='"
						+ itemId + "'";
				System.out.println("SQL for update " + sql);

				dbStmt.executeUpdate(sql);

				// update transaction table to set return date as today's date
				sql = "update lib_item_transaction SET RETURN_DATE=sysdate, STATUS='AVAILABLE' where ITEM_ID='"
						+ itemId + "' AND USER_ID='" + userId + "'";
				System.out.println("SQL for update " + sql);

				// insert record in transaction table
				dbStmt2.execute(sql);

				System.out.println("SQL executed");

				isCheckin = true;

				this.closeDbConnection(dbConnection);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Error in checkinItem function" + e);
			if (dbConnection != null) 
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting checkinItem function ");

		return isCheckin;
	}
	
	/**
	 *
	 * @param userId
	 * @param itemId
	 * @return
	 */
	public boolean renewItem(int userId, int itemId) 
	{
		System.out.println(
				"DAO: Entering renewItem function user Id =" + userId + " item Id =" + itemId);
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean isRenewed = false;

		try 
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null) 
			{
				String sql = "";
				dbStmt = dbConnection.createStatement();

				// update transaction table to set return date as today's date
				sql = "update lib_item_transaction SET DUE_DATE=sysdate+20, STATUS='RENEWED' where ITEM_ID='"
						+ itemId + "' AND USER_ID='" + userId + "'";
				System.out.println("SQL for update " + sql);

				// insert record in transaction table
				dbStmt.execute(sql);

				System.out.println("SQL executed");

				isRenewed = true;

				this.closeDbConnection(dbConnection);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Error in renewItem function" + e);
			if (dbConnection != null) 
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting renewItem function ");

		return isRenewed;
	}

	/**
	 * Method to insert notification in Notification table
	 * @param user
	 * @param content
	 * @return
	 */
	public boolean insertNotification(int userId, String content)
	{
		System.out.println("DAO: Entering insertNotification function ");
		Connection dbConnection = null;
		Statement dbStmt = null;
		boolean success = false;

		try
		{
			dbConnection = this.getDbConnection();
			if (dbConnection != null)
			{
				dbStmt = dbConnection.createStatement();
				String sql = "insert into lib_notification (NOTIFICATION_ID, USER_ID, NOTIFY_DATE, MESSAGE) values (NOTEID_SEQ.NEXTVAL, '"+userId+"', sysdate, '"+content+"')";
				System.out.println("SQL ="+sql);
				dbStmt.execute(sql);

				success = true;

				this.closeDbConnection(dbConnection);
			}
		}
		catch(Exception e)
		{ 
			System.out.println("Error in insertNotification function"+e);
			if (dbConnection != null)
			{
				this.closeDbConnection(dbConnection);
			}
		}
		System.out.println("DAO: Exiting insertNotification function success="+success);
		
		return success;
	}
	
}
