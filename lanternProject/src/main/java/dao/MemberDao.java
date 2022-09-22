package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	 
	public static MemberDao getInstance() {
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
	// joinResult, IdConfirm, LoginResult
			public Member select(String id) {
				return (Member) session.selectOne("memberns.select", id);
			}
			
			// joinResult
			public int insert(Member member) {			
				return session.insert("memberns.insert", member);
			}

			public int update(Member member) {
				return session.update("memberns.update",member);
			}

			public int delete(int mno) {
				return session.update("memberns.delete",mno);
			}
			// FindIdResult
			public Member findId(String name, String phone) {
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("name", name);
				hm.put("phone", phone);
				return (Member) session.selectOne("memberns.findId", hm);
			}
			
			// FindPwResult
			public Member findPassword(String id, String name) {
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("id", id);
				hm.put("name", name);
				return (Member) session.selectOne("memberns.findPassword", hm);
			}

			public int getTotal() {
				return (int)session.selectOne("memberns.getTotal");
			}

			public List<Member> list(int startRow, int endRow) {
				HashMap<String, Integer> hm = new HashMap<>();
				hm.put("startRow", startRow);
				hm.put("endRow", endRow);
				return (List<Member>)session.selectList("memberns.list",hm);
			}
}
