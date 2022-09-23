package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.BoardReplyDao;
import model.Board;
import model.BoardReply;
import service.CommandProcess;

public class BoardContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		/* boardList에서 받아온 데이터 */
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		String pageNum = request.getParameter("pageNum");
		
		/* 게시판 관련 담기 */
		BoardDao bd = BoardDao.getInstance();
		/* boardContent로 정보를 보내기 위해 board 객체에 정보를 담는다 */
		Board board = bd.select(review_no);
		/* 조회수 증가 */
		bd.read_cntUpdate(review_no);

		/* 댓글 관련 담기 */
		BoardReplyDao rd = BoardReplyDao.getInstance();
		List<BoardReply> rp_list = rd.list(review_no);
		
		/* 담은 정보들을 보낼 준비 */
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		
		request.setAttribute("rp_list", rp_list);
		
		return "boardContent";
	}

}
