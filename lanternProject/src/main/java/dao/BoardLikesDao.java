package dao;

import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	
	// BoardLikes에서 member_no가 좋아요했던 review_no이 있는지 확인
	public int select(int review_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("reivew_no", review_no);
		return (int) session.selectOne("bdlikesns.select", hm);
	}
	
	
}
