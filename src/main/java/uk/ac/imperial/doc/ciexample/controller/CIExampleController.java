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

    String paramA = request.getParameter("id");
    String paramB = request.getParameter("name");

    ModelAndView model = new ModelAndView("ciexample");
    if(paramA != null)
      model.addObject("id", request.getParameter("id"));

    if(paramB != null)
      model.addObject("name", request.getParameter("name"));


    CIExampleBasic cibasic = new CIExampleBasic();
    if(paramA != null && paramB != null) {
      cibasic.setParams(paramA, paramB);
      model.addObject("result");
    }

    return model;
  }

}
