package service.fest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.FestivalDao;
import model.Festival;
import service.CommandProcess;

public class FestView implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		BookmarkDao bmd = BookmarkDao.getInstance();
		HttpSession session = request.getSession();
		if (session.getAttribute("member_no") != null) {
			
		}
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FestivalDao fd = FestivalDao.getInstance();
		Festival festival = fd.select(fno);
		
		request.setAttribute("festival", festival);
		
		return "festView";
}
}
