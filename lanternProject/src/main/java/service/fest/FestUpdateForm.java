package service.fest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FestivalDao;
import model.Festival;
import service.CommandProcess;

public class FestUpdateForm implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FestivalDao fd = FestivalDao.getInstance();
		Festival festival = fd.select(fno);
		
		request.setAttribute("festival", festival);
		
		return "festUpdateForm";
	}
	
}
