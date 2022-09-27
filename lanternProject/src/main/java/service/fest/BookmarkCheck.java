package service.fest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import model.Bookmark;
import service.CommandProcess;

public class BookmarkCheck implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int fno = Integer.parseInt(request.getParameter("fno"));
		int member_no = (int)session.getAttribute("member_no");
		
		BookmarkDao bmd = BookmarkDao.getInstance();
		Bookmark bm = bmd.select(fno, member_no);
		
		if (bm == null) {
			bmd.insert(fno, member_no);
		} else {
			bmd.delete(fno, member_no);
		}
		
		return "bookmarkCheck";
	}

}
