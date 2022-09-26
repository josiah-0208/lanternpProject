package service.fest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class FestRegistForm implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "festRegistForm";
	}
}
