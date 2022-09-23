package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BoardReply;

public class BoardReplyDao {
	// SingleTon
	private static BoardReplyDao instance = new BoardReplyDao();
	
	private BoardReplyDao() {
	}
	
	public static BoardReplyDao getInstance() {
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
	
	/* ReplyWrite에서 받은 값을 sql을 통해 insert */
	public int insert(BoardReply reply) {
		return (int) session.insert("replyns.insert", reply);
	}

	/* BoardContent에서 받은 값으로 sql을 통해 조회(select) */
	@SuppressWarnings("unchecked")
	public List<BoardReply> list(int review_no) {
		return session.selectList("replyns.list", review_no);
	}

	/* ReplyDelete에서 받은 값으로 sql을 통해 delete */
	public int delete(int reply_no) {
		return session.delete("replyns.delete", reply_no);
	}
	
	
}
