package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;
import model.Festival;

public class FestivalDao {
	private static FestivalDao instance = new FestivalDao();
	private FestivalDao() {}
	public static FestivalDao getInstance() {
		return instance;
	}
	
	// MyBatis
	private static SqlSession session; 
	static {  
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);  
		}catch (Exception e) {
			System.out.println("초기화 에러 : "+e.getMessage());
		}
	}
	@SuppressWarnings("unchecked")
	public List<Festival> list1(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return (List<Festival>)session.selectList("festivalns.list1",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Festival> list2(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return (List<Festival>)session.selectList("festivalns.list2",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Festival> listLoc1(String loc, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("loc", loc);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("festivalns.selectLoc1", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Festival> listLoc2(String loc, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("loc", loc);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("festivalns.selectLoc2", map);
	}
	
	public int getTotal1() {
		return (int)session.selectOne("festivalns.getTotal1");
	}
	
	public int getTotal2() {
		return (int)session.selectOne("festivalns.getTotal2");
	}
	
	public int getTotalLoc1(String loc) {
		return (int)session.selectOne("festivalns.getTotalLoc1", loc);
	}
	
	public int getTotalLoc2(String loc) {
		return (int)session.selectOne("festivalns.getTotalLoc2", loc);
	}
	
	public int insert(Festival festival) {
		return session.insert("festivalns.insert", festival); 
	}
	
	public Festival select(int fno) {
		return (Festival) session.selectOne("festivalns.select", fno);
	}
	
	public int update(Festival festival) {
		return session.update("festivalns.update", festival);
	}
	public int delete(int fno) {
		return session.update("festivalns.delete", fno);
	}
	public int getTotal() {
		return (int)session.selectOne("festivalns.getTotal");
	}
	public List<Festival> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return (List<Festival>)session.selectList("festivalns.list",map);
	}
	
	
	
	
	
}
