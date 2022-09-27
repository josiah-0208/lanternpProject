package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;

public class BoardDao {
	// SingleTon
	private static BoardDao instance = new BoardDao();

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		return instance;
	}
	
	// mybatis 연결
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
	
	/* boardList에서 게시글 select하면 상세 내용 보여주기 */
	public Board select(int review_no) { // boardContent
		return (Board) session.selectOne("boardns.selectOne", review_no);
		
	}
	
	/* BoardWriteAction에서 받은 값을 sql을 통해 게시글 insert */
	public int insert(Board board) {
		return (int) session.insert("boardns.insert", board);
	}

	/* BoardUpdateAction에서 받은 값을 sql을 통해 게시글 update */
	public int update(Board board) {
		return session.update("boardns.update", board);
	}
	
	/* BoardContent에서 받은 값을 sql을 통해 게시글 delete(update) */
	public int delete(int review_no) {
		return session.delete("boardns.delete", review_no);
	}
	
	
	/* 페이징 */
	 // BoardList
	public int getTotal() {
		return (int) session.selectOne("boardns.getTotal");
	}
	 // BoardList
	@SuppressWarnings("unchecked")
	public List<Board> list(int startRow, int endRow) {
			HashMap<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("boardns.list", map);
	}

	
	/* 게시판 조회수(read_cnt) 증가 */
	public void read_cntUpdate(int review_no) {
		session.update("boardns.read_cntUpdate", review_no);
		
	}

	public int getTotalMy(int member_no) {
		return (int)session.selectOne("boardns.getTotalMy",member_no);
	}

	public List<Board> myList(int member_no, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("member_no", member_no);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("boardns.myList", hm);
	}

	
}
