package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import service.CommandProcess;

public class BoardDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		/* boardContent에서 받는 값 */
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		/* 받은 review_no 값을 result에 담는다 */
		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(review_no);
		
		/* result를 보낼 준비 */
		request.setAttribute("result", result);
		
		return "boardDelete";
	}

}
