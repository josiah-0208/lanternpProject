package dao;

import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Bookmark;
import service.board.BoardLikes;

public class BoardLikesDao {
	// SingleTon
	private static BoardLikesDao instance = new BoardLikesDao();
	
	private BoardLikesDao() {
	}
	
	public static BoardLikesDao getInstance() {
		return instance;
	}
	
	// Mybatis 연결
	private static SqlSession session;
	static {
			try {
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
			} catch (Exception e) {
				System.out.println("초기화 에러: "+e.getMessage());
			}
	}
	
	// 게시글 좋아요 조회
	public BoardLikes select(int review_no, int member_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("review_no", review_no);
		hm.put("member_no", member_no);
		return (BoardLikes)session.selectOne("bdlikesns.select", hm);
	};

	// 게시글 좋아요 insert
	public void insert(int review_no, int member_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("review_no", review_no);
		hm.put("member_no", member_no);
		session.selectOne("bdlikesns.insert", hm);
		
	}

	// 게시글 좋아요 delete
	public void delete(int review_no, int member_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("review_no", review_no);
		hm.put("member_no", member_no);
		session.selectOne("bdlikesns.delete", hm);
		
	}
	
	
}
