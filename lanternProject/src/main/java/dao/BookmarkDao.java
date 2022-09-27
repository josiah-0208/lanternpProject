package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Bookmark;

public class BookmarkDao {
	private static BookmarkDao instance = new BookmarkDao();
	private BookmarkDao () {}
	
	public static BookmarkDao getInstance() {
		return instance;
	}
	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public Bookmark select(int fno, int member_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("fno", fno);
		hm.put("member_no", member_no);
		return (Bookmark)session.selectOne("bookmarkns.select", hm);
	}

	public void insert(int fno, int member_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("fno", fno);
		hm.put("member_no", member_no);
		session.selectOne("bookmarkns.insert", hm);
	}

	public void delete(int fno, int member_no) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("fno", fno);
		hm.put("member_no", member_no);
		session.selectOne("bookmarkns.delete", hm);
	}

	public int getTotalMy(int member_no) {
		return (int)session.selectOne("bookmarkns.getTotalMy",member_no);
	}

	public List<Bookmark> myList(int member_no, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("member_no", member_no);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("bookmarkns.myList", hm);
	}
}
