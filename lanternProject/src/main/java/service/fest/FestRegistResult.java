package service.fest;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FestivalDao;
import model.Festival;
import service.CommandProcess;

public class FestRegistResult implements CommandProcess{
@Override
public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
	Festival festival = new Festival();
	
	String real = request.getSession().getServletContext().getRealPath("/upload");
	int maxSize = 30 * 1024 * 1024;
	
	
	try {
		MultipartRequest mr = new MultipartRequest(request, real, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//String thumbnail_2 = mr.getParameter("thumbnail");
		//String f_img_2 = mr.getParameter("f_img");
		
		String fname = mr.getParameter("fname"); System.out.println("fname: "+fname);
		String intro = mr.getParameter("intro"); System.out.println("intro: "+intro);
		Date start_date = Date.valueOf(mr.getParameter("start_date")); System.out.println("start_date: "+start_date);
		Date end_date = Date.valueOf(mr.getParameter("end_date")); System.out.println("end_date: "+end_date);
		String hours = mr.getParameter("hours"); System.out.println("hours: "+hours);
		String host = mr.getParameter("host"); System.out.println("host: "+host);
		String loc = mr.getParameter("loc"); System.out.println("loc: "+loc);
		String addr = mr.getParameter("addr"); System.out.println("addr: "+addr);
		String spot = mr.getParameter("spot"); System.out.println("spot: "+spot);
		String home_pg = mr.getParameter("home_pg"); System.out.println("home_pg: "+home_pg);
		String tel = mr.getParameter("tel"); System.out.println("tel: "+tel); 
		
		int fee = 0;
		if (mr.getParameter("fee") != null && !mr.getParameter("fee").equals("")) {
			fee = Integer.parseInt(mr.getParameter("fee"));
		} System.out.println(fee);
		int fee_child = 0;
		if (mr.getParameter("fee_child") != null && !mr.getParameter("fee_child").equals("")) {
			fee_child = Integer.parseInt(mr.getParameter("fee_child"));
		} System.out.println(fee_child);
		int fee_teen = 0;
		if (mr.getParameter("fee_teen") != null && !mr.getParameter("fee_teen").equals("")) {
			fee_teen = Integer.parseInt(mr.getParameter("fee_teen"));
		} System.out.println(fee_teen);
		int fee_adult = 0;
		if (mr.getParameter("fee_adult") != null && !mr.getParameter("fee_adult").equals("")) {
			fee_adult = Integer.parseInt(mr.getParameter("fee_adult"));
		} System.out.println(fee_adult);
		
		String f_txt = mr.getParameter("f_txt"); System.out.println("f_txt: "+f_txt);
		String thumbnail = mr.getOriginalFileName("thumbnail"); System.out.println("thumbnail: "+thumbnail);
		// 이곳에 null이 Map을 넘기는 과정 중에 부적합한 연산자 1111을 일으킴 sql에 jdbcType=VARCHAR 추가
		String f_image = mr.getOriginalFileName("f_image"); System.out.println("f_image: "+f_image);
		
		festival.setFname(fname);
		festival.setIntro(intro);
		festival.setStart_date(start_date);
		festival.setEnd_date(end_date);
		festival.setHours(hours);
		festival.setHost(host);
		festival.setLoc(loc);
		festival.setAddr(addr);
		festival.setSpot(spot);
		festival.setHome_pg(home_pg);
		festival.setTel(tel);
		festival.setFee(fee);
		festival.setFee_child(fee_child);
		festival.setFee_teen(fee_teen);
		festival.setFee_adult(fee_adult);
		festival.setF_txt(f_txt);
		festival.setThumbnail(thumbnail);
		festival.setF_image(f_image);
		
	} catch (IOException e) {
		System.out.println(e.getMessage());
		
	}
	
	FestivalDao fd = FestivalDao.getInstance();
	fd.insert(festival);
	
	
	return "festMain";
}
}
