package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(review_no);
		
		request.setAttribute("board", board);
		request.setAttribute("review_no", review_no);
		
		return "boardUpdateForm";
	}

}
