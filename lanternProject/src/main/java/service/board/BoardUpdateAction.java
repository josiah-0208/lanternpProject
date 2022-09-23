package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		/* boardUpdateForm에서 넘어온 데이터를 받아온다 */
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		int member_no = Integer.parseInt(request.getParameter("member_no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String fileData = request.getParameter("fileData");
		String pageNum = request.getParameter("pageNum");
		
		/* board를 생성하고 받은 데이터를 담는다 */
		Board board = new Board();
		board.setReview_no(review_no);
		board.setMember_no(member_no);
		board.setTitle(title);
		board.setContent(content);
		board.setFileData(fileData);
		
		System.out.println(pageNum);
		
		/* board에 담은 데이터를 result에 담아 dao에 보내 update한다 */
		BoardDao bd = BoardDao.getInstance();
		int result = bd.update(board);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "boardUpdateAction";
	}

}
