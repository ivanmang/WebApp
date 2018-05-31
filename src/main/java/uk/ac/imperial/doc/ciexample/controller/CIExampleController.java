package uk.ac.imperial.doc.ciexample.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import uk.ac.imperial.doc.ciexample.CIExampleBasic;

public class CIExampleController extends AbstractController {

  private int count;

  @Override
  protected ModelAndView handleRequestInternal(HttpServletRequest request,
                                               HttpServletResponse response) throws Exception {

    String paramA = request.getParameter("ernm");
    String paramAction = request.getParameter("action");

    ModelAndView model = new ModelAndView("ciexample");


    CIExampleBasic cibasic = new CIExampleBasic();



    if(paramAction != null && paramA!= null) {
      if (paramAction.equals("insert")) {
        cibasic.runInsert(2,paramA);
      } else if (paramAction.equals("select")) {
        model.addObject("id", cibasic.runSelect());
      }
    }

    return model;
  }

}
