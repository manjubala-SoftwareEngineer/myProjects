package com.library.bo;

import com.library.dao.*;

/**
 * UserProfile class to handle all user related operations
 *
 */
public class UserProfile 
{

	/**
	 * to check if the user is valid
	 * @param loginId
	 * @param password
	 * @return
	 */
	public User authenticateUser(String loginId, String password)
	{
		LibraryDAO db = new LibraryDAO();
		User user = db.authenticateUser(loginId, password); 
		return user;
	}

	/**
	 * to check if the user is valid
	 * @param loginId
	 * @param password
	 * @return
	 */
	public boolean changePassword(User user)
	{
		boolean isPasswordChanged = false;
		LibraryDAO db = new LibraryDAO();
		isPasswordChanged = db.changePassword(user); 
		return isPasswordChanged;
	}
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean createUser(User user)
	{
		System.out.println("BO: Entering createUser function User="+user);
		boolean isUserCreated = false;
		String content="";
		LibraryDAO library = new LibraryDAO();
		Transaction trans = new Transaction();
		
		if (user!=null)
		{
			isUserCreated = library.createUser(user);
		}

		System.out.println("BO: Exiting createUser function isUserCreated="+isUserCreated);
		if (isUserCreated)
		{
			content = "Welcome to Library Checkout System! User Successfully Created. User - "+user.getLoginId()+" Password - "+user.getPassword()+". Please change your password on first login.";			
			trans.sendMail(user, content);
		}
		return isUserCreated;
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user)
	{
		System.out.println("BO: Entering updateUser function User="+user);
		boolean isUserUpdated = false;
		LibraryDAO library = new LibraryDAO();
		
		if (user!=null)
		{
			isUserUpdated = library.updateUser(user);
		}

		System.out.println("BO: Exiting updateUser function isUserUpdated="+isUserUpdated);
		
		return isUserUpdated;
	}

	/**
	 * 
	 * @param userId
	 * @return
	 */
	public User getUser(int userId)
	{
		User user=null;
		
		LibraryDAO library = new LibraryDAO();
		
		user = library.getUser(userId);
		
		return user;
	}

	/**
	 * 
	 * @param search
	 * @return
	 */
	public User[] searchUser(String search)
	{
		User[] user=null;
		
		LibraryDAO library = new LibraryDAO();
		
		user = library.searchUser(search);
		
		return user;
	}

}
