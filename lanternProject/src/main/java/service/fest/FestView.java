package service.fest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.FestivalDao;
import model.Bookmark;
import model.Festival;
import service.CommandProcess;

public class FestView implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		int check = 0;
		
		BookmarkDao bmd = BookmarkDao.getInstance();
		HttpSession session = request.getSession();
		if (session.getAttribute("member_no") != null) {
			int member_no = (int)session.getAttribute("member_no");
			System.out.println(member_no);
			Bookmark bm = bmd.select(fno, member_no);
			
			if (bm != null) {
				check = 1;
			}
		}
		
		FestivalDao fd = FestivalDao.getInstance();
		Festival festival = fd.select(fno);
		
		request.setAttribute("festival", festival);
		request.setAttribute("check", check);
		
		return "festView";
		}
}
