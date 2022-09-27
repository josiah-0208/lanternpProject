package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		/* boardWriteForm에서 넘어온 데이터를 받는다 */
		int member_no = (Integer.parseInt(request.getParameter("member_no")));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String fileData = request.getParameter("fileData");
		
		/* board객체를 생성해 받은 데이터를 담는다 */
		Board board = new Board();
		board.setMember_no(member_no);
		board.setTitle(title);
		board.setContent(content);
		board.setFileData(fileData);
		
		/* board에 담은 데이터를 result에 담아 dao에 보내 insert 시킨다 */
		BoardDao bd = BoardDao.getInstance();
		result = bd.insert(board);
		
		request.setAttribute("result", result);
		
		return "boardWriteAction";
	}

}
