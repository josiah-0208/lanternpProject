package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int member_no = 0;
		int result = 0;
		MemberDao md = MemberDao.getInstance();
		if (id.equals("master")) {
			member_no = Integer.parseInt(request.getParameter("member_no"));
			result = md.delete(member_no);
			
		} else {
			if(id!=null) {
				member_no = (int) session.getAttribute("member_no");
				result = md.delete(member_no);
				if(result>0) session.invalidate();
			}
		}
		request.setAttribute("result", result);
		return "delete";
	}

}
