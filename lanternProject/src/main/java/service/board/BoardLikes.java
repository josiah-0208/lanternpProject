package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.BoardLikesDao;
import model.Board;
import service.CommandProcess;

public class BoardLikes implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		// BoardLikes에서 member_no가 좋아요했던 review_no이 있는지 확인
		BoardLikesDao bld = BoardLikesDao.getInstance();
		int bd_likes = bld.select(review_no);
		
		// 전역변수 생성
		String imgSrc = "";
		int likes = 0;

		// board 테이블의 likes 변경하기 위해 객체 추가
		BoardDao bd = BoardDao.getInstance();
		
		if (likes > 0) { // 좋아요 한 게시글이 있으면
			bld.delete(member_no, review_no); // bdlikes 테이블에서 데이터 삭제
			bd.likesMinus(review_no); // likes - 1
			imgSrc = "../../images/orangeHt.png";

		} else if (likes == 0) { // 좋아요 한 게시글이 없으면
			bld.insert(member_no, review_no); // bdlikes 테이블에 데이터 추가
			bd.likesPlus(review_no); // likes + 1
			imgSrc = "../../images/trans.png";
		}			
		
		// board 테이블의 현재 likes 조회
		Board board = bd.select(review_no);
		likes = board.getLikes();
		
		request.setAttribute("likes", likes);
		request.setAttribute("imgSrc", imgSrc);
		
		
		return "boardLikes";
	}

}
