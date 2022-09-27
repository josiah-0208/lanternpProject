package service.myProfile;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookmarkDao;
import dao.FestivalDao;
import dao.MemberDao;
import model.Bookmark;
import model.Festival;
import model.Member;
import service.CommandProcess;

public class MyBookmark implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("member_no") != null) {
			int member_no = (int) session.getAttribute("member_no"); // session member_no

			MemberDao md = MemberDao.getInstance();
			Member member = md.select(member_no);

			BookmarkDao bmd = BookmarkDao.getInstance();

			final int ROW_PER_PAGE = 5; // 한 페이지에 게시글 6개 씩
			final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩

			String pageNum = request.getParameter("pageNum"); // 페이지 번호
			if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
				pageNum = "1";
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지

			int total = bmd.getTotalMy(member_no); // 총 게시글 수
			int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수

			int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
			int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

			int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
			int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

			if (endPage > totalPage)
				endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
			FestivalDao fd = FestivalDao.getInstance();
			List<Bookmark> list = bmd.myList(member_no, startRow, endRow);
			List<Festival> flist = new ArrayList<>();
			for(Bookmark bm : list) {
				int fno=bm.getFno();
				flist.add(fd.select(fno));
			}
			request.setAttribute("member", member);
			request.setAttribute("list", list);
			request.setAttribute("flist", flist);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("total", total);
			request.setAttribute("bmTotal", total);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		}
		return "myBookmark";
	}

}
