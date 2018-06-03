package Evena.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Evena.Event;
import Evena.DataService.DataServiceAPI;
import Evena.Functions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Controller
public class EvenaController {

  private static List<Event> events = new ArrayList<Event>();

//  static {
//    events.add(new Event("Barack", "Obama"));
//    events.add(new Event("George", "Bush"));
//    events.add(new Event("Bill", "Clinton"));
//    events.add(new Event("Ronald", "Reagan"));
//  }

  @RequestMapping(value = "/event")
  protected ModelAndView redirect(HttpServletRequest request) {
    ModelAndView model = new ModelAndView("event");
    String event_name = request.getParameter("event");

    try {
      Connection conn = DataServiceAPI.connect();
      String sql =  "Select * From \"Event\" Where \"Event Name\" = '" + event_name + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if(result.next()) {
        model.addObject("id",result.getInt("Event Id"));
        model.addObject("name",result.getString("Event Name"));
        model.addObject("date",result.getString("Date"));
        model.addObject("about",result.getString("About"));
      }
      pstmt.close();

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }
    return model;
  }


  @RequestMapping(value = "/index")
  protected ModelAndView main(HttpServletRequest request,
                                               HttpServletResponse response) throws Exception {

    String paramAction = request.getParameter("action");

    ModelAndView model = new ModelAndView("main");

    Functions queryhandler = new Functions();

    String event_name = request.getParameter("ernm");
    String event_date = request.getParameter("date");
    String event_about = request.getParameter("About");



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
