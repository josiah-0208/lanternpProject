package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import model.Board;
import service.CommandProcess;

public class BoardList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao bd = BoardDao.getInstance();
		
		final int ROW_PER_PAGE = 10;	// 한 페이지에 들어갈 게시글 갯수
		final int PAGE_PER_BLOCK = 5;	// 한 블럭에 들어갈 페이지수
		
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1"; // 페이지 초기값 1로 설정
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		
		int total = bd.getTotal(); // 총 게시글수
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글 시작 번호 (변수 num의 끝)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호 (변수 num = 1)
		
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭당 시작 페이지(1, 11, ..)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭당 마지막 페이지
		
		if (endPage > totalPage) // 마지막 페이지가 총 페이지보다 클 경우
			endPage = totalPage;
		
		// 데이터를 담을 객체 생성
		List<Board> list = bd.list(startRow, endRow);
		List<Board> list2 = bd.list2(startRow, endRow);

		// 객체 안에 담을 데이터 준비
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		
		return "boardList";
	}

}
