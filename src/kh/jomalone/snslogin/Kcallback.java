package kh.jomalone.snslogin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kh.jomalone.DAO.MembersDAO;
import kh.jomalone.DTO.KMembersDTO;


@WebServlet("/Kcallback")
public class Kcallback extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-www-form-urlencoded;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String code = request.getParameter("code");
		String apiURL;
	    apiURL = "https://kauth.kakao.com/oauth/token";
	    apiURL +="?grant_type=authorization_code";
	    apiURL +="&client_id=6d5630d4385069dbc2b5bcdc92d10cd4" ;
	    apiURL +="&redirect_uri=http://localhost:8080/JoMalone/Kcallback" ;
	    apiURL +="&code="+ code;
	   
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
		
		try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("POST");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // ���� ȣ��
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // ���� �߻�
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      System.out.println(res.toString());
		      br.close();
		      
		      if(responseCode==200) {

				JsonParser parser = new JsonParser();
				JsonElement el = parser.parse(res.toString());
				JsonObject obj = el.getAsJsonObject();
				
				access_token = obj.get("access_token").toString();
				refresh_token = obj.get("refresh_token").toString();
		      }
		      
		    
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		
	    if(access_token != null) { 
	    	try {
	    		String apiurl = "https://kapi.kakao.com/v2/user/me"; 
	    		String header = "Bearer " + access_token; 
	    	
	    		URL url = new URL(apiurl);
			      HttpURLConnection con = (HttpURLConnection)url.openConnection();
			      con.setRequestMethod("GET");
	
			      con.setRequestProperty("Authorization", header);
			      int responseCode = con.getResponseCode();
			      BufferedReader br;
			      System.out.print("responseCode="+responseCode);
			      if(responseCode==200) { // ���� ȣ��
			        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			      } else {  // ���� �߻�
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			      }
			      String inputLine;
			      StringBuffer res = new StringBuffer();
			      while ((inputLine = br.readLine()) != null) {
			        res.append(inputLine);
			      }
			      br.close();
			      if(responseCode==200) {
			    	
				        System.out.println(res.toString());

						JsonParser parser = new JsonParser();
						JsonElement el = parser.parse(res.toString());
						JsonObject obj = el.getAsJsonObject();
						String id = obj.get("id").toString();
					
						String property = obj.get("properties").toString();
						String account = obj.get("kakao_account").toString();
						
						JsonElement a_el = parser.parse(account.toString());
						JsonObject a_obj = a_el.getAsJsonObject();
						JsonElement profile = parser.parse(a_obj.get("profile").toString());
						String name = profile.getAsJsonObject().get("nickname").toString();
						String email;
						String birthday;
						String gender;
						
						
						if(a_obj.get("birthday") != null) {
							birthday = a_obj.get("birthday").toString();
						}else {
							birthday = null;
						}
						
						if(a_obj.get("email") != null) {
							email = a_obj.get("email").toString();
						}else {
							email = null;
						}

						if(a_obj.get("gender") != null) {
							gender = a_obj.get("gender").toString();
						}else {
							gender = null;
						}
						
						System.out.println(id+name+email+birthday+gender);
						
						MembersDAO dao = MembersDAO.getInstance();
						
						boolean result = dao.Klogin(access_token);
						System.out.println(result);
						
						if(result) {
							request.getSession().setAttribute("loginInfo", id);
							request.setAttribute("name", name);
							request.getRequestDispatcher("test.jsp").forward(request, response);
					
						}else {
							KMembersDTO kdto = new KMembersDTO(id,null,access_token,name,email,birthday,gender);
							dao.KFirstLogin(kdto);
							request.getSession().setAttribute("loginInfo", id);
							request.setAttribute("name", name);
							request.getRequestDispatcher("test.jsp").forward(request, response);

						}
				      }
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    }
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
