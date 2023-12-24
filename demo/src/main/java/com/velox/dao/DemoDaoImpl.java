package com.velox.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.velox.model.User;

@Repository
@Transactional
public class DemoDaoImpl implements DemoDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public String addUser(User user) {
		String status = null;
		try {
			int value = (int) sessionFactory.getCurrentSession().save(user);
			status = (value > 0) ? "success" : "error";
		} catch (Exception e) {
			status = "error";
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public List<User> getUserList() {
		List<User> result = null;

		try {
			result = sessionFactory.getCurrentSession().createQuery("from User").list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public User findUser(int id) {
		User user = null;
		try {
			user = sessionFactory.getCurrentSession().get(User.class, id);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return user;
	}

	@Override
	public String updateUser(User user) {
		String status = null;
		try {
			sessionFactory.getCurrentSession().update(user);

			status = "success";

		} catch (Exception e) {
			status = "error";
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public String updateUserSQL(String srno,String administrator ,String username, String email, String password, String birthday,
			String phone, String gender, String country, String vehicle) {
		String status = null;

		try {
			Query query = sessionFactory.getCurrentSession().createQuery("update User set username=:uname,email=:mail,"
					+ "password=:pass,Birthday=:dob,Telephone=:phone,Gender=:gender,Country=:country,vehicle=:vehicle, userrole=:administr where user_id=:srno");
			query.setParameter("srno", Integer.parseInt(srno));
			query.setParameter("uname", username);
			query.setParameter("mail", email);
			query.setParameter("pass", password);
			query.setParameter("dob", birthday);
			query.setParameter("phone", phone);
			query.setParameter("gender", gender);
			query.setParameter("country", country);
			query.setParameter("vehicle", vehicle);
			query.setParameter("administr", administrator);

			query.executeUpdate();
			status = "success";
		} catch (Exception e) {
			status = "error";
		}

		return status;
	}

	@Override
	public String deleteUser(User user) {
		String status = null;
		try {
			sessionFactory.getCurrentSession().delete(user);

			status = " success ";

		} catch (Exception e) {
			status = "error";
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public String[] login(String username, String password) {

		String[] status = new String[2];
		List<User> userlist = null;
		User result = null;
		String usernames = null;

		try {
			Query query = sessionFactory.getCurrentSession().createQuery("FROM User where username=:user");
			query.setParameter("user", username);
			userlist = query.list();
			result = userlist.get(0);
			
			for (User user : userlist) {
				usernames = user.getUsername();
			}

			if (result.getPassword().equals(password)  && usernames.equals(username)) {
				status[0] = "Success";
				status[1] = result.getUserrole();
			} else {
				status[0] = "Invalid User OR Password !!";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(userlist +" dao controlle");
		System.out.println(result +" dao controlle");
//		System.out.println(status[0]+" dao controller ");
//		System.out.println(status[1]+" dao controller ");
		return status;
	}

	@Override
	public List<Object[]> getChartDetails() {
		
		 List<Object[]> result = null;
		    try {
		    	result = sessionFactory.getCurrentSession().createSQLQuery("SELECT userrole,COUNT(*) FROM user GROUP BY userrole").list();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return result;
	}
}
