package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardReplyDao;
import model.BoardReply;
import service.CommandProcess;

public class ReplyDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		/* boardContent에서 받는 데이터 */
		int reply_no = Integer.parseInt(request.getParameter("reply_no"));
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		System.out.println(reply_no);
		System.out.println(review_no);
		
		/* result에 받은 데이터 담기 */
		BoardReplyDao rd = BoardReplyDao.getInstance();
		int result = rd.delete(reply_no);
		
		/* result를 dao에 보낼 준비 */
		request.setAttribute("result", result);
		request.setAttribute("review_no", review_no);
		
		return "replyDelete";
	}

}
