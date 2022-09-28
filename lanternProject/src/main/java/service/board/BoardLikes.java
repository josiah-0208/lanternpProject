package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.BoardLikesDao;
import model.Board;
import service.CommandProcess;

public class BoardLikes implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		System.out.println("review_no: "+review_no);
		int member_no = (int)session.getAttribute("member_no");
		System.out.println("member_no: "+member_no);
		
		BoardLikesDao bld = BoardLikesDao.getInstance();
		BoardLikes bm = bld.select(review_no, member_no);
		
		if (bm == null) {
			bld.insert(review_no, member_no);
		} else {
			bld.delete(review_no, member_no);
		}
		
		return "boardLikes";
	}

}
