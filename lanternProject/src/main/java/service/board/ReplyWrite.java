package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardReplyDao;
import model.BoardReply;
import service.CommandProcess;

public class ReplyWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		/* boardContent에서 넘어온 정보들을 받는다 */
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		int member_no = Integer.parseInt(request.getParameter("member_no"));
		String rp_content = request.getParameter("rp_content");
		
		/* reply 객체를 생성해 받은 데이터를 담는다 */
		BoardReply reply = new BoardReply();
		reply.setReview_no(review_no);
		reply.setMember_no(member_no);
		reply.setRp_content(rp_content);
		
		/* reply에 담은 데이터를 result에 담아 dao에 보내 댓글을 insert 시킨다 */
		BoardReplyDao rd = BoardReplyDao.getInstance();
		int result = rd.insert(reply);
		
		request.setAttribute("result", result);
		// 댓글 입력 성공 후 replyWrite에서 받을 review_no
		request.setAttribute("review_no", review_no);
		
		return "replyWrite";
	}

}
