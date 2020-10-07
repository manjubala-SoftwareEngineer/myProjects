package com.library.bo;

import com.library.dao.LibraryDAO;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


/**
 * 
 *
 */
public class Transaction 
{

	/**
	 * 
	 */
	public Transaction() 
	{
	}
	
	
	/**
	 * 
	 */
	public boolean checkoutItem(User user, int itemId)
	{
		boolean isCheckout = false;
		Item item = null;
		
		LibraryDAO library = new LibraryDAO();
		Inventory inventory = new Inventory();

		item = inventory.getInventoryItem(itemId);
		
		if (item != null)
		{
			isCheckout = library.checkoutItem(user, item);
		}

		return isCheckout;
		
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	public ItemTrans[] getCheckoutList(User user)
	{
		ItemTrans[] checkoutItems = null;
		LibraryDAO library = new LibraryDAO();
		
		checkoutItems = library.getCheckOutList(user);
		
		return checkoutItems;
		
	}
	
	/**
	 * 
	 * @param userId
	 * @param itemId
	 * @return
	 */
	public boolean checkinItem(int userId, int itemId)
	{
		boolean isCheckin = false;
		
		 LibraryDAO library = new LibraryDAO();
		 
		 isCheckin = library.checkinItem(userId, itemId);

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
		boolean isRenewed = false;
		
		 LibraryDAO library = new LibraryDAO();

		 isRenewed = library.renewItem(userId, itemId);
		 
		return isRenewed;
		
	}
	
	/**
	 * 
	 * @param user
	 * @param itemId
	 * @return
	 */
	public boolean sendNotification(int userId, int itemId, String dueDate)
	{
		 User user = null;
		 Item item = null;
		 String content="";
		 boolean success=false;
		 
		 LibraryDAO library = new LibraryDAO();
		 Inventory inventory = new Inventory();
		 UserProfile profile = new UserProfile();

		 //if (trans.getDueDate().equals(new Date()))
		 //{
			 item = inventory.getInventoryItem(itemId);
			 user = profile.getUser(userId);
			 
			 //item is due today, update notification table and send reminder mail
			 content="Dear "+user.getFirstName()+". Gentle Reminder.  Item - "+item.getTitle()+" is Due on "+dueDate+".";
			 
			 success = library.insertNotification(userId, content);
			 
			 this.sendMail(user, content);
			 
			 return success;
		 //}
		 
	}
	
	
	/**
	 * 
	 * @param user
	 * @param item
	 * @param operation
	 */
	public void sendMail(User user, String content)
	{
		System.out.println("Sent message Operation");
        
		
		final String username = "donotreplyback2019@gmail.com";
        final String password = "libraryadmin2019";

        try {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class",    
                  "javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");
        
        Session session = Session.getInstance(props,    
                new javax.mail.Authenticator() {    
                protected PasswordAuthentication getPasswordAuthentication() {    
                return new PasswordAuthentication(username,password);  
                }    
               });            		

		System.out.println("Sent message session created");

		System.out.println("Email TO : "+user.getEMail());

		MimeMessage message = new MimeMessage(session);    
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(user.getEMail()));
        message.setSubject("Library Notification");    
        message.setText(content);    

        	
        //send message  
        Transport.send(message);    
        
    		System.out.println("Email sent successfully.");

        } catch (Exception e) {
            e.printStackTrace();;
        }		
	}
}
