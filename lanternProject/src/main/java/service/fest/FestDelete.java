package service.fest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FestivalDao;
import service.CommandProcess;

public class FestDelete implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FestivalDao fd = FestivalDao.getInstance();
		fd.delete(fno);
		
		
		return "festMain";
}
}
