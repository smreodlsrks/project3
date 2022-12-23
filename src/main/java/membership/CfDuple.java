package membership;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CfDuple")
public class CfDuple extends HttpServlet {
     protected void service(HttpServletRequest request, HttpServletResponse response)
    		 throws ServletException, IOException {
          String id = request.getParameter("id");
          PrintWriter out = response.getWriter();
          
          MembershipDAO dao = new MembershipDAO(getServletContext());
			/*
			 * int duple = dao.isMember(id); if(duple == 1) { out.print("success"); } else {
			 * out.print("fail"); }
			 */
     }
}