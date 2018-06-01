package Evena.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Evena.Event;
import Evena.DataService.DataServiceAPI;
import Evena.Functions;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public class EvenaController extends AbstractController {

  private static List<Event> events = new ArrayList<Event>();

//  static {
//    events.add(new Event("Barack", "Obama"));
//    events.add(new Event("George", "Bush"));
//    events.add(new Event("Bill", "Clinton"));
//    events.add(new Event("Ronald", "Reagan"));
//  }

  @Override
  protected ModelAndView handleRequestInternal(HttpServletRequest request,
                                               HttpServletResponse response) throws Exception {





    ModelAndView model = new ModelAndView("main");

    Functions queryhandler = new Functions();

    String event_name = request.getParameter("ernm");
    String event_date = request.getParameter("date");
    String event_about = request.getParameter("About");
    String paramAction = request.getParameter("action");


    if(paramAction != null) {
      if (paramAction.equals("insert") && event_name!= null && event_date!=null && event_about != null) {
        DataServiceAPI d = new DataServiceAPI();
        int id = 1;
        while(d.exist(id)){
          id = ThreadLocalRandom.current().nextInt(1, 255);
        }
        queryhandler.runInsert(id,event_name,event_date,event_about);
      } else if (paramAction.equals("select")) {
        String query = request.getParameter("search");
        int i = queryhandler.runSelect(query);
        model.addObject("result", i);
      }
    }

    DataServiceAPI a = new DataServiceAPI();
    model.addObject("eventList", a.selectall());

    return model;
  }

}
