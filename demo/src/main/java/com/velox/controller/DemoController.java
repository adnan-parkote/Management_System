package com.velox.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.velox.service.DemoService;
import com.velox.service.DemoServiceImpl;

@Controller
public class DemoController {

	@Autowired
	DemoService demoservice;

	@RequestMapping(value = "/createUser", method = RequestMethod.GET)
	public String home() {

		return "createUser";
	}

	@RequestMapping(value = "/loginUser", method = RequestMethod.GET)
	public String login() {

		return "loginUser";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			String administrator = request.getParameter("administrator");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String birthday = request.getParameter("birthday");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String country = request.getParameter("country");
			String vehicle = request.getParameter("vehicle");

			String status = demoservice.addUser(administrator, username, email, password, birthday, phone, gender,
					country, vehicle);
			out.print(status);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@RequestMapping(value = "/userDetails", method = RequestMethod.GET)
	public String userDetails() {
		return "getUserDetails";
	}

	@RequestMapping(value = "/getUserList", method = RequestMethod.POST)
	public String getUserList(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			JSONArray result = demoservice.getUserList();
			out.print(result);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}

	@RequestMapping(value = "/getUserDetails", method = RequestMethod.POST)
	public void getUserDetails(HttpServletRequest request, HttpServletResponse response) {

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			PrintWriter out = response.getWriter();
			JSONObject result = demoservice.getUserDetails(id);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public void updateUser(HttpServletRequest request, HttpServletResponse response) {
		try {

			PrintWriter out = response.getWriter();
			String srno = request.getParameter("srno");
			String administrator = request.getParameter("administrator");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String birthday = request.getParameter("birthday");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String country = request.getParameter("country");
			String vehicle = request.getParameter("vehicle");

			String status = demoservice.updateUser(srno, administrator, username, email, password, birthday, phone,
					gender, country, vehicle);
			out.print(status);

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String srno = request.getParameter("srno");

//			System.out.println(srno);

			String status = demoservice.deleteUser(srno);
			out.print(status);

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		try {
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			String[] result = demoservice.login(username, password);

			if (result[0].equals("Success")) {
				session.setAttribute("username", username);
				session.setAttribute("userrole", result[1]);
			}

			out.print(result[0].toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "home";
	}

	@RequestMapping(value = "/getChartDetails", method = RequestMethod.POST)
	public void getChartDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		try {
			PrintWriter out = response.getWriter();
			JSONArray result = demoservice.getChartDetails();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
