package uk.ac.imperial.doc.ciexample.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import uk.ac.imperial.doc.ciexample.CIExampleBasic;

public class CIExampleController extends AbstractController {

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
		HttpServletResponse response) throws Exception {

		String paramA = request.getParameter("a");
		String paramB = request.getParameter("b");
		String paramAction = request.getParameter("action");
		
		ModelAndView model = new ModelAndView("ciexample");
		if(paramA != null)
			model.addObject("a", request.getParameter("a"));
		
		if(paramB != null)
			model.addObject("b", request.getParameter("b"));
		
		if(paramAction != null) {
			String action = request.getParameter("action");
			if(action.equals("add") || action.equals("sub"))
				model.addObject("action", action);
		}
		
		CIExampleBasic cibasic = new CIExampleBasic();
		if(paramA != null && paramB != null && paramAction != null) {
			cibasic.setParams(paramA, paramB, paramAction);
			model.addObject("result", cibasic.runAction());
		}
		
		return model;
	}

}
