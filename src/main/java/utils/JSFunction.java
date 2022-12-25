package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script>"
						  + "	alert('" + msg + "');"
						  + "	location.href='" + url + "';"
						  + "</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "<script>"
					  	  + "	alert('" + msg + "');"
					  	  + "	history.back();"
					  	  + "</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
	
	public static void cookiePage(JspWriter out) {
        try {
            String script = "<script>"
                          + "   open('../Pages/Cookie.jsp', "
                          + "   'cookie', "
                          + "	'width=450, height=645, left=100, top=100, "
                          + "	location=no, toolbar=no, menubar=no, "
                          + "	scrollbars=yes, resizable=no')"
                          + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }
	
	/*
	 앞의 2개의 메서드는 JSP에서 out내장객체를 받은후 Javascript함수를
	 실행한다. 하지만 서블릿에서는 JSP의 내장객체를 매개변수로 받을 수
	 없으므로 out내장객체 대신 response내장객체를 통해 컨텐츠 타입을
	 설정한 후 JS코드를 실행해야 한다.
	 */
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			//컨텐츠 타입을 설정
			resp.setContentType("text/html; charset=UTF-8");
			//PrintWriter객체를 통해 스크립트를 서블릿에서 직접 출력한다.
			PrintWriter writer = resp.getWriter();
			String script = "<script>"
						  + "	alert('" + msg + "');"
						  + "	location.href='" + url + "';"
						  + "</script>";
			writer.print(script);
		}
		catch(Exception e) {}
	}
	
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = "<script>"
					  	  + "	alert('" + msg + "');"
					  	  + "	history.back();"
					  	  + "</script>";
			writer.print(script);
		}
		catch(Exception e) {}
	}
}
