package service.myProfile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class MyProfileMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pgm = request.getParameter("pgm");
		if (pgm == null || pgm.equals(""))
			pgm = "../member/updateForm.do";
		else pgm+=".do";
		request.setAttribute("pgm", pgm);
		return "myProfileMain";
	}

}
