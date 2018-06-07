package Evena.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Evena.*;
import Evena.DataService.DataServiceAPI;
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

  @RequestMapping(value = "/register")
  protected ModelAndView register(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("register");
    String eventID = request.getParameter("eventid");
    model.addObject("id",eventID);
    try {
      Connection conn = DataServiceAPI.connect();
      String sql =  "Select eventName From events Where eventID = '" + eventID + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if(result.next()) {
        model.addObject("name",result.getString("eventName"));
      }
      pstmt.close();

    } catch (Exception e) {
    }
    return model;
  }

  @RequestMapping(value = "/manage")
  protected ModelAndView manage(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("manage");
    DataServiceAPI a = new DataServiceAPI();
    if(request.getParameter("deleteall")!=null){
      try {
        Connection conn = DataServiceAPI.connect();
        String sql =  "Delete From events";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();

      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }
    else if(request.getParameter("delete")!=null){
      try {
        Connection conn = DataServiceAPI.connect();
        String sql =  "Delete From events Where eventID = '" + request.getParameter("delete") + "' ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();

      } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }
    model.addObject("eventList", a.selectall());
    return model;
  }

  @RequestMapping(value = "/eventdir")
  protected ModelAndView eventdir(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("eventdir");
    model.addObject("event",request.getParameter("event"));

    //partilist
      try {
          Connection conn = DataServiceAPI.connect();
          String sql =  "Select participantID From events_Participants Where eventID = '" + request.getParameter("event") + "'" ;
          PreparedStatement pstmt = conn.prepareStatement(sql);
          ResultSet result = pstmt.executeQuery();
          ParticipantList p_list = new ParticipantList();
          List<Participant> list = new ArrayList<>();
          while(result.next()){
              sql =  "Select participantName From participants Where participantID = '" + result.getString("participantID") + "'" ;
              pstmt = conn.prepareStatement(sql);
              ResultSet p_result = pstmt.executeQuery();
              p_result.next();
              Participant p = new Participant(result.getString("participantID"),p_result.getString("participantName"));
              list.add(p);
          }
          p_list.setParticipants(list);
          pstmt.close();
          model.addObject("p_list",p_list);

      } catch (Exception e) {
          System.out.println(e.getMessage());
          e.printStackTrace();
      }

      //manageinfo

      String sql;
      String id;
      if(request.getParameter("update")!=null){
          Connection conn = DataServiceAPI.connect();
          if(!request.getParameter("name").equals("")) {
              sql = "UPDATE events SET eventName = '" + request.getParameter("name") + "' WHERE eventID = '" + request.getParameter("update")+ "'";
              PreparedStatement pstmt = conn.prepareStatement(sql);
              pstmt.executeUpdate();
          }
          if(!request.getParameter("date").equals("")) {
//        System.out.println(request.getParameter("date"));
              sql = "UPDATE events SET eventDate = '" + request.getParameter("date") + "' WHERE eventID = '" + request.getParameter("update")+ "'";
              PreparedStatement pstmt = conn.prepareStatement(sql);
              pstmt.executeUpdate();
          }
          if(!request.getParameter("about").equals("")) {
              sql = "UPDATE events SET info = '" + request.getParameter("about") + "' WHERE eventID = '" + request.getParameter("update")+ "'";
              PreparedStatement pstmt = conn.prepareStatement(sql);
              pstmt.executeUpdate();
          }
          id = request.getParameter("update");
      }else{
          id = request.getParameter("event");
      }
      try {
          Connection conn = DataServiceAPI.connect();
          sql =  "Select * From events Where eventID = '" + id + "' ";
          PreparedStatement pstmt = conn.prepareStatement(sql);
          ResultSet result = pstmt.executeQuery();
          if(result.next()) {
              model.addObject("id",result.getString("eventID"));
              model.addObject("name",result.getString("eventName"));
              model.addObject("date",result.getString("eventDate"));
              model.addObject("about",result.getString("info"));
          }
          pstmt.close();

      } catch (Exception e) {
          System.out.println(e.getMessage());
          e.printStackTrace();
      }

      //manageinfoboard

      if(request.getParameter("info")!=null) {
          if (!request.getParameter("info").equals("")) {
              int info_id = 1;
              try {
                  Connection conn = DataServiceAPI.connect();
                  sql = "Select * From info Where \"infoID\" = '" + info_id + "' ";
                  PreparedStatement pstmt = conn.prepareStatement(sql);
                  ResultSet result = pstmt.executeQuery();
                  while (result.next()) {
                      info_id = ThreadLocalRandom.current().nextInt(2, 255);
                      sql = "Select participantID From participants Where participantID = '" + info_id + "' ";
                      pstmt = conn.prepareStatement(sql);
                      result = pstmt.executeQuery();
                  }
                  sql = "Insert Into info Values ('" + info_id + "' , '" + request.getParameter("event") + "' , '" + request.getParameter("info") + " ')";
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
    ModelAndView model = new ModelAndView("signin");;
    model.addObject("action",action);
    return model;
  }

  @RequestMapping(value = "/browse")
  protected ModelAndView browse(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("browse");
    DataServiceAPI a = new DataServiceAPI();
    model.addObject("eventList", a.selectall());
    return model;
  }

  @RequestMapping(value = "/event")
  protected ModelAndView redirect(HttpServletRequest request) {
    ModelAndView model = new ModelAndView("event");
    String event_name = request.getParameter("event");
    int id = 1;
    if (event_name == null && request.getParameter("ernm")!= null ){
      event_name = request.getParameter("ernm");
      DataServiceAPI d = new DataServiceAPI();
      try {

        while (d.exist(id)) {
          id = ThreadLocalRandom.current().nextInt(1, 255);
        }
        d.insert(id,event_name,request.getParameter("date"),request.getParameter("About"));

      }
      catch(Exception e){}
    }

    if (request.getParameter("join")!= null ){
      String eventID = request.getParameter("join");
      String p_name = request.getParameter("p_name");
      int p_id = 1;
      try {
        Connection conn = DataServiceAPI.connect();
        String sql =  "Select participantID From participants Where participantID = '" + p_id + "' ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
        while (result.next()) {
          System.out.println(p_id);
          p_id = ThreadLocalRandom.current().nextInt(2, 255);
          sql =  "Select participantID From participants Where participantID = '" + p_id + "' ";
          pstmt = conn.prepareStatement(sql);
          result = pstmt.executeQuery();
        }
        sql = "Insert Into participants( participantID, participantName) Values (" + p_id +" , '" + p_name + "')";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        sql = "Insert Into events_Participants(eventID,participantID) Values (" + eventID +" , '" + p_id + "')";
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
      }
      catch(Exception e){
        System.out.println(e.getMessage());
        e.printStackTrace();
      }
    }

    try {
      Connection conn = DataServiceAPI.connect();
      String sql =  "Select \"infoText\" From info Where \"eventID\" = '" + request.getParameter("event") + "'" ;
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      List<Info> list = new ArrayList<>();
      while(result.next()){
          Info i = new Info(result.getString("infoText"));
          list.add(i);
      }
      InfoList ilist = new InfoList();
      ilist.setInfos(list);
      pstmt.close();
      model.addObject("infoList",ilist);

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }

    try {
      Connection conn = DataServiceAPI.connect();
      String sql =  "Select * From events Where eventID = '" + request.getParameter("event") + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if(result.next()) {
        model.addObject("id",id);
        model.addObject("name",result.getString("eventName"));
        model.addObject("date",result.getString("eventDate"));
        model.addObject("about",result.getString("info"));
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

}
