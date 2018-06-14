package Evena.controller;

import static Evena.DataService.DataServiceAPI.selectAllSql;
import static Evena.DataService.DataServiceAPI.selectUpcomingSql;

import Evena.DataService.DataServiceAPI;
import Evena.Event;
import Evena.EventList;
import Evena.Info;
import Evena.InfoList;
import Evena.Participant;
import Evena.ParticipantList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EvenaController {

  private static List<Event> events = new ArrayList<Event>();
  private DataServiceAPI api = new DataServiceAPI();

//  static {
//    events.add(new Event("Barack", "Obama"));
//    events.add(new Event("George", "Bush"));
//    events.add(new Event("Bill", "Clinton"));
//    events.add(new Event("Ronald", "Reagan"));
//  }

  @RequestMapping(value = "/register")
  protected ModelAndView register(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("register");
    String eventID = request.getParameter("eventid");
    model.addObject("id", eventID);
    try {
      Connection conn = DataServiceAPI.connect();
      String sql =
          "Select eventName From events Where eventID = '" + eventID + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if (result.next()) {
        model.addObject("name", result.getString("eventName"));
      }
      pstmt.close();

    } catch (Exception e) {
    }
    return model;
  }

  @RequestMapping(value = "/manage")
  protected ModelAndView manage(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("manage");
    if (request.getParameter("deleteall") != null) {
      try {
        Connection conn = DataServiceAPI.connect();
        String sql = "Delete From events";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();

      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    } else if (request.getParameter("delete") != null) {
      try {
        Connection conn = DataServiceAPI.connect();
        String sql = "Delete From events Where eventID = '" + request
            .getParameter("delete") + "' ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();

      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }
    model.addObject("eventList", api.selectall(selectAllSql));
    return model;
  }

  @RequestMapping(value = "/eventdir")
  protected ModelAndView eventdir(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("eventdir");
    model.addObject("event", request.getParameter("event"));

    //delete participant
    if(request.getParameter("delete") != null) {
      try {
        Connection conn = DataServiceAPI.connect();
        String sql = "DELETE FROM participants WHERE participantid = '" + request.getParameter("delete") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }

    //partilist
    try {
      Connection conn = DataServiceAPI.connect();
      String sql =
          "Select participantID From events_Participants Where eventID = '"
              + request.getParameter("event") + "'";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      ParticipantList p_list = new ParticipantList();
      List<Participant> list = new ArrayList<>();
      while (result.next()) {
        sql =
            "Select participantName, email, phone, age, gender, specinfo From participants Where participantID = '"
                + result.getString("participantID") + "'";
        pstmt = conn.prepareStatement(sql);
        ResultSet p_result = pstmt.executeQuery();
        p_result.next();
        Participant p = new Participant(result.getString("participantID"),
            p_result.getString("participantName"),
            p_result.getString("email"),
            p_result.getString("phone"),
            p_result.getString("age"),
            p_result.getString("gender"),
            p_result.getString("specinfo"));
        list.add(p);
      }
      p_list.setParticipants(list);
      pstmt.close();
      model.addObject("p_list", p_list);

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }

    //manageinfo

    String sql;
    String id;
    if (request.getParameter("update") != null) {
      Connection conn = DataServiceAPI.connect();
      if (!request.getParameter("name").equals("")) {
        sql = "UPDATE events SET eventName = '" + request.getParameter("name")
            + "' WHERE eventID = '" + request.getParameter("update") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
      }
      if (!request.getParameter("date").equals("")) {
//        System.out.println(request.getParameter("date"));
        sql = "UPDATE events SET eventDate = '" + request.getParameter("date")
            + "' WHERE eventID = '" + request.getParameter("update") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
      }
      if (!request.getParameter("location").equals("")) {
        sql = "UPDATE events SET eventLocation = '" + request.getParameter("location")
                + "' WHERE eventID = '" + request.getParameter("update") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
      }
      if (!request.getParameter("about").equals("")) {
        sql = "UPDATE events SET info = '" + request.getParameter("about")
            + "' WHERE eventID = '" + request.getParameter("update") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
      }
      id = request.getParameter("update");
    } else {
      id = request.getParameter("event");
    }
    try {
      Connection conn = DataServiceAPI.connect();
      sql = "Select * From events Where eventID = '" + id + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if (result.next()) {
        model.addObject("id", result.getString("eventID"));
        model.addObject("name", result.getString("eventName"));
        model.addObject("date", result.getString("eventDate"));
        model.addObject("location",result.getString("eventLocation"));
        model.addObject("about", result.getString("info"));
      }
      pstmt.close();

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }

    //manageinfoboard

    if (request.getParameter("info") != null) {
      if (!request.getParameter("info").equals("")) {
        int info_id = 1;
        try {
          Connection conn = DataServiceAPI.connect();
          sql = "Select * From info Where \"infoID\" = '" + info_id + "' ";
          PreparedStatement pstmt = conn.prepareStatement(sql);
          ResultSet result = pstmt.executeQuery();
          while (result.next()) {
            info_id = ThreadLocalRandom.current().nextInt(2, 255);
            sql =
                "Select participantID From participants Where participantID = '"
                    + info_id + "' ";
            pstmt = conn.prepareStatement(sql);
            result = pstmt.executeQuery();
          }
          sql = "Insert Into info Values ('" + info_id + "' , '" + request
              .getParameter("event") + "' , '" + request.getParameter("info")
              + " ')";
          pstmt = conn.prepareStatement(sql);
          pstmt.executeUpdate();
          pstmt.close();
        } catch (Exception e) {
          System.out.println(e.getMessage());
          e.printStackTrace();
        }
      }
    }

    return model;
  }

  @RequestMapping(value = "/create")
  protected ModelAndView create(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("create");
    return model;
  }


  @RequestMapping(value = "/signin")
  protected ModelAndView signin(HttpServletRequest request) throws Exception {
    String action = request.getParameter("action");
    ModelAndView model = new ModelAndView("signin");
    ;
    model.addObject("action", action);
    return model;
  }

  @RequestMapping(value = "/browse")
  protected ModelAndView browse(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("browse");
    if (request.getParameter("search") == null) {
      model.addObject("eventList", api.selectall(selectUpcomingSql));
    }

    //search for exact word
//    else if(request.getParameter("search").equals("word")){
//        try {
//            Connection conn = DataServiceAPI.connect();
//            String sql =  "SELECT * FROM events WHERE eventName LIKE 'word' OR eventName LIKE 'word %' OR eventName LIKE '% word' OR eventName LIKE ' word '";
//            PreparedStatement pstmt = conn.prepareStatement(sql);
//            ResultSet result = pstmt.executeQuery();
//            List<Event> events = new ArrayList<>();
//            EventList eventList = new EventList();
//
//            while(result.next()){
//                String date = result.getString("eventDate");
//                if (date == null){
//                    date = "NA";
//                }
//                String about = result.getString("info");
//                if (about == null){
//                    about = "NA";
//                }
//                Event event = new Event(String.valueOf(result.getInt("eventID")),result.getString("eventName"),date,about);
//                events.add(event);
//            }
//
//            eventList.setEvents(events);
//            pstmt.close();
//            model.addObject("eventList", eventList);
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//            e.printStackTrace();
//        }
//    }
    else {
      try {
        Connection conn = DataServiceAPI.connect();
        String sql = "SELECT * FROM events WHERE eventName LIKE '%" + request
            .getParameter("evnm") + "%'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
        List<Event> events = new ArrayList<>();
        EventList eventList = new EventList();

        api.addResultSetToEventList(result, events);

        eventList.setEvents(events);
        pstmt.close();
        model.addObject("eventList", eventList);

      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }

    return model;
  }

  @RequestMapping(value = "/event")
  protected ModelAndView redirect(HttpServletRequest request) {
    ModelAndView model = new ModelAndView("event");
    String event_name = request.getParameter("event");
    int id = 1;
    if (event_name == null && request.getParameter("ernm") != null) {
      try {

        while (api.exist(id)) {
          id = ThreadLocalRandom.current().nextInt(1, 255);
        }
        api.insert(id, request.getParameter("ernm"), request.getParameter("date"), request.getParameter("location"),
            request.getParameter("About"));
        event_name = Integer.toString(id);

      } catch (Exception e) {
      }
    }

    if (request.getParameter("join") != null) {
      String eventID = request.getParameter("join");
      event_name = eventID;
      String p_name = request.getParameter("p_name");
      int p_id = 1;
      try {
        Connection conn = DataServiceAPI.connect();
        String sql =
            "Select participantID From participants Where participantID = '"
                + p_id + "' ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
        while (result.next()) {
          System.out.println(p_id);
          p_id = ThreadLocalRandom.current().nextInt(2, 255);
          sql = "Select participantID From participants Where participantID = '"
              + p_id + "' ";
          pstmt = conn.prepareStatement(sql);
          result = pstmt.executeQuery();
        }
        sql =
            "Insert Into participants( participantID, participantName, email, phone, age, gender, \"specinfo\") Values ("
                + p_id + " , '" + p_name + "' , '" +
                request.getParameter("email") + "' , " +
                request.getParameter("phone") + " , " +
                request.getParameter("age") + " , '" +
                request.getParameter("gender") + "' , '" +
                request.getParameter("specinfo")
                + "')";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        sql = "Insert Into events_Participants(eventID,participantID) Values ("
            + eventID + " , '" + p_id + "')";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }

    try {
      Connection conn = DataServiceAPI.connect();
      String sql =
          "Select \"infoText\" From info Where \"eventID\" = '" + event_name
              + "'";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      List<Info> list = new ArrayList<>();
      while (result.next()) {
        Info i = new Info(result.getString("infoText"));
        list.add(i);
      }
      InfoList ilist = new InfoList();
      ilist.setInfos(list);
      pstmt.close();
      model.addObject("infoList", ilist);

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }

    try {
      Connection conn = DataServiceAPI.connect();
      String sql = "Select * From events Where eventID = '" + event_name + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if (result.next()) {
        model.addObject("id", id);
        model.addObject("name", result.getString("eventName"));
        model.addObject("date", result.getString("eventDate"));
        model.addObject("location",result.getString("eventLocation"));
        model.addObject("about", result.getString("info"));
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
    ModelAndView model = new ModelAndView("main");
    return model;
  }
/*
  @RequestMapping(value = "/browsetags")
  protected ModelAndView tags(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("browse");
    int tag = Integer.valueOf(request.getParameter("tagid"));

    try{
      Connection conn = DataServiceAPI.connect();
      String sql = "SELECT * FROM events";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      List<Event> events = new ArrayList<>();
      EventList eventList = new EventList();

      while(result.next()){
        String tagids = result.getString("tagids");
        List<Integer> tags = new ArrayList<>();
        if(request.getParameter("tagids") != null) {
          tags = convertTagsToList(tagids);
        }

        if(tags.contains(tag)) {
          String date = result.getString("eventDate");
          if(date == null) {
            date = "N/A";
          }

          String about = result.getString("info");
          if (about == null){
            about = "N/A";
          }
          Event event = new Event(String.valueOf(result.getInt("eventID")),result.getString("eventName"), date, about,
              tags);

          events.add(event);

          eventList.setEvents(events);
          pstmt.close();
          model.addObject("eventList", eventList);
        }
      }

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }

    return model;
  }*/

  private List<Integer> convertTagsToList(String tagids) {
    List<Integer> tags = new ArrayList<>();
    if (tagids.length() != 0) {
      for (String str : tagids.split(",")) {
        tags.add(Integer.valueOf(str));
      }
    }
    return tags;
  }

}
