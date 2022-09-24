package service.fest;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FestivalDao;
import model.Festival;
import service.CommandProcess;

public class FestMain implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String tab = request.getParameter("tab"); // 보내줄 tab 값
		String loc = request.getParameter("loc");
		System.out.println("loc-1: "+loc);
		
		
		FestivalDao fd = FestivalDao.getInstance();
		
		final int ROW_PER_PAGE = 3;
		final int PAGE_PER_BLOCK = 7;
		
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = currentPage * ROW_PER_PAGE;
		
		int total = fd.getTotal1();
		if (tab.equals("2")) {
			total = fd.getTotal2();
		}
		System.out.println("total-1: "+total);
		List<Festival> list = fd.list1(startRow, endRow);
		if (tab.equals("2")) {
			list = fd.list2(startRow, endRow);
		}
		System.out.println(startRow);
		System.out.println(endRow);
		System.out.println("list: "+list.size());
		System.out.println("total-2: "+total);
		List<Festival> listLoc = null;
		if (loc != null && loc != "") {
			System.out.println("total-3: "+total);
			listLoc = fd.listLoc1(loc, startRow, endRow);
			if (tab.equals("2")) {
				listLoc = fd.listLoc2(loc, startRow, endRow);
			}
			total = fd.getTotalLoc1(loc);
			if (tab.equals("2")) {
				total = fd.getTotalLoc2(loc);
			}

		}
		System.out.println("total-4: "+total);
		
		// Math.ceil : 현재 실수보다 큰 정수
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		System.out.println("totalPage-1: "+totalPage);
		// 시작페이지 : 현재페이지 - (현재페이지 - 1) % 10			
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		// 끝페이지 : 시작페이지 + 블록당페이지 수 -1			
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		// 총 페이지보다 큰 endPage는 나올 수 없다.
		if (endPage > totalPage) endPage = totalPage;
		// paging : end
				
		// 날짜 세팅
		Date today = Date.valueOf(LocalDate.now());
		
		request.setAttribute("tab", tab);
		request.setAttribute("list", list);
		request.setAttribute("loc", loc);
		request.setAttribute("listLoc", listLoc);
		request.setAttribute("today", today);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		System.out.println("----------------------");
		return "festMain";
	}

}
