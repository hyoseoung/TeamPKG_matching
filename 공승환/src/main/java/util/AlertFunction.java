package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AlertFunction {
	public static void alertBack(HttpServletResponse resp, String msg) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String script = "<script>"
                          + "    alert('" + msg + "');"
                          + "    history.back();"
                          + "</script>";
            writer.print(script);
        }
        catch (Exception e) {}
    }
	public static void alertLocation(HttpServletResponse resp,String msg,String url) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer=resp.getWriter();
			String script ="<script>"
				+ "	alert('"+msg+"');"
				+ "	location.href='"+url+"';"
				+ " </script>";
			writer.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
