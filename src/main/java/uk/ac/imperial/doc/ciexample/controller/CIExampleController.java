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




    if(paramAction != null) {
      if (paramAction.equals("insert") && paramA!= null ) {
        cibasic.runInsert(3,paramA);
      } else if (paramAction.equals("select")) {
        String query = request.getParameter("search");
        System.out.println(query);
        int i = cibasic.runSelect(query);
        System.out.println(i);
        model.addObject("result", i);
      }
    }

    return model;
  }

}
