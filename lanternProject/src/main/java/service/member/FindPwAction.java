package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindPwAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findPassword(id, name);	
		if(member!=null) {
			if(member.getId().equals("master"))member=null;
		}//관리자면 안알랴줌
		request.setAttribute("member", member);
		return "findPwResult";
	}

}
