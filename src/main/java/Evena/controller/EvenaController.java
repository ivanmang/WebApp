package Evena.controller;

import static Evena.DataService.DataServiceAPI.selectAllSql;
import static Evena.DataService.DataServiceAPI.selectUpcomingSql;
import static Evena.DataService.DataServiceAPI.tagToID;

import Evena.DataService.DataServiceAPI;
import Evena.DataService.SelectClause;
import Evena.DataService.SelectQueryBuilder;
import Evena.DataService.WhereClause;
import Evena.Dynamic_partic;
import Evena.Dynamic_partic_list;
import Evena.Event;
import Evena.EventList;
import Evena.Info;
import Evena.InfoList;
import Evena.Participant;
import Evena.ParticipantList;
import Evena.Dynamic_partic;
import Evena.Dynamic_partic_list;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("username")
public class EvenaController {

  private static List<Event> events = new ArrayList<>();
  private DataServiceAPI api = new DataServiceAPI();

    @RequestMapping(value = "/user_register", method = RequestMethod.GET)
    protected  ModelAndView user_register_page(){
        ModelAndView model = new ModelAndView("user_register");
        model.addObject("username_placeholder", "\"Please enter your username\"");
        model.addObject("password_placeholder", "\"Please enter your password\"");
        model.addObject("re_con_pw_placeholder", "\"Please confirm your password\"");
        return model;
    }

    @RequestMapping(value = "/user_register", method = RequestMethod.POST)
    protected  ModelAndView user_register(@RequestParam String username, @RequestParam String password, @RequestParam String re_password) throws Exception{
        ModelAndView model;
        if (username.length()<=6 || username.length()>=20){
            model = new ModelAndView("user_register");
            model.addObject("error_message","invalid username\n");
            model.addObject("username_placeholder", "\"Please re-enter your username\"");
            model.addObject("password_placeholder", "\"Please re-enter your password\"");
            model.addObject("re_con_pw_placeholder", "\"Please confirm your password\"");
        }else if (password.length()<=10 || password.length()>=40){
            model = new ModelAndView("user_register");
            model.addObject("error_message","invalid password");
            model.addObject("username_default","default");
            model.addObject("username_placeholder", "\"" + username + "\"");
            model.addObject("password_placeholder", "\"Please re-enter your password\"");
            model.addObject("re_con_pw_placeholder", "\"Please confirm your password\"");
        } else if(!password.equals(re_password)){
            model = new ModelAndView("user_register");
            model.addObject("error_message","invalid confirming password");
            model.addObject("username_default","default");
            model.addObject("username_placeholder", "\"" + username + "\"");
            model.addObject("password_placeholder", "\"Please re-enter your password\"");
            model.addObject("re_con_pw_placeholder", "\"Please confirm your password\"");
        }else {
            int user_id = ThreadLocalRandom.current().nextInt(1, 255);
            Connection conn = DataServiceAPI.connect();
            String user_idStr = String.valueOf(user_id);
            SelectClause s = new SelectClause("userid", null);
            WhereClause w = new WhereClause("userid", "=", user_idStr, null, null);
            String sql = new SelectQueryBuilder().addselectClauses(s).addFromClause("user").addWhereList(w).build();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();
            while (result.next()) {
                user_id = ThreadLocalRandom.current().nextInt(1, 255);
                sql =  "Select \"userid\" From \"user\" Where \"userid\" = '" + user_id + "' ";
                pstmt = conn.prepareStatement(sql);
                result = pstmt.executeQuery();
            }
            sql = "Insert Into \"user\"(userid, username , password) Values (" + user_id +" , '" +
                    username + "', '"+ password + "')";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
            model = new ModelAndView("manage");
            model.addObject("username",username);
        }
        return model;
    }

    @RequestMapping(value = "/logout")
    protected  ModelAndView logout(HttpServletRequest request) throws Exception{
        ModelAndView model  = new ModelAndView("main");
        model.addObject("username","out");
        return model;
    }

    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    protected  ModelAndView sign_in_done(@RequestParam String username, @RequestParam String password, @RequestParam String action) throws Exception{
        ModelAndView model;
        Connection conn = DataServiceAPI.connect();
        String sql =  "Select \"password\" From \"user\" Where \"username\" = '" + username + "'" ;
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();

        //check if username exist and if it does, if the password matches
        if(result.next()){
            if(!result.getString("password").equals(password)){
                return new ModelAndView("main");
            }
        } else{
            return new ModelAndView("main");
        }

        if(action.equals("create")){
            model = new ModelAndView("d_create");
            model.addObject("username",username);
        }else {
            model = new ModelAndView("manage");

            List<Event> events = new ArrayList<>();
            EventList eventList = new EventList();

            sql = "Select * From events Where \"username\" = '" + username + "'";
            pstmt = conn.prepareStatement(sql);
            result = pstmt.executeQuery();

            DataServiceAPI d = new DataServiceAPI();
            d.addResultSetToEventList(result,events);
            pstmt.close();
            eventList.setEvents(events);

            model.addObject("eventList", eventList);

        }

        model.addObject("username",username);
        return model;
    }

    @RequestMapping(value = "/signin", method = RequestMethod.GET)
    protected ModelAndView signin(HttpServletRequest request) throws Exception {
        String action = request.getParameter("action");
        ModelAndView model = new ModelAndView("signin");
        model.addObject("action", action);
        return model;
    }

    @RequestMapping(value = "/d_create")
    protected  ModelAndView d_create(HttpServletRequest request) throws Exception{
        ModelAndView model = new ModelAndView("d_create");
        return model;
    }

    @RequestMapping(value = "/d_create_done")
    protected  ModelAndView d_create_done(HttpServletRequest request) throws Exception{
        ModelAndView model = new ModelAndView("event");
        int event_id = ThreadLocalRandom.current().nextInt(1, 255);
        Connection conn = DataServiceAPI.connect();

        String tagids = translateTags(request);
        DataServiceAPI d = new DataServiceAPI();

        while (d.exist(event_id)) {
            event_id = ThreadLocalRandom.current().nextInt(1, 255);
        }
        String sql = "Insert Into events(eventID, eventName , eventLocation, eventDate , eventStart, eventEnd , info , tagids ,  \"reg_form_format\" ) " +
                "Values (" + event_id +" , '" + request.getParameter("name") + "', '"+ request.getParameter("location") + "', '" + request.getParameter("date") + "', '"
                + request.getParameter("startTime") + "', '" + request.getParameter("endTime") + "', '"+ request.getParameter("About") + "', '" +  tagids +
                "', '"+ request.getParameter("create") + "')";
        System.out.println(sql);
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();

        model.addObject("id",event_id);
        model.addObject("name",request.getParameter("name"));
        model.addObject("location", request.getParameter("location"));
        model.addObject("date",request.getParameter("date"));
        model.addObject("startTime", request.getParameter("startTime"));
        model.addObject("endTime",request.getParameter("endTime"));
        model.addObject("about",request.getParameter("About"));

        pstmt.close();
        return model;
    }


    @RequestMapping(value = "/d_partilist")
    protected  ModelAndView dynamic_register(HttpServletRequest request) throws Exception{
        ModelAndView model = new ModelAndView("d_partilist");
        Connection conn = DataServiceAPI.connect();

        //select list of participants
        String sql =  "Select participantID From events_Participants Where eventID = '" + request.getParameter("id") + "'" ;
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet result = pstmt.executeQuery();
        List<Dynamic_partic> list = new ArrayList<>();
        while(result.next()){
            sql =  "Select participantName From participants Where participantID = '" + result.getString("participantID") + "'" ;
            pstmt = conn.prepareStatement(sql);
            ResultSet p_result = pstmt.executeQuery();
            p_result.next();
            Dynamic_partic d = new Dynamic_partic(result.getString("participantID"),"\"" + p_result.getString("participantName" )+"\"");
            list.add(d);
        }
        Dynamic_partic_list d_list = new Dynamic_partic_list();
        d_list.setParticipants(list);
        model.addObject("data",d_list);

        //extract the format of the data from events
        sql =  "Select reg_form_format From events Where eventID = '" + request.getParameter("id") + "' ";
        pstmt = conn.prepareStatement(sql);
        result = pstmt.executeQuery();
        if(result.next()) {
            if(result.getString("reg_form_format")!=null) {
                model.addObject("reg_form_format", "\"" + result.getString("reg_form_format") + "\"");
            }
            else{
                model.addObject("reg_form_format", "\"name\"");
            }
        }
        pstmt.close();
        return model;
    }

  @RequestMapping(value = "/register")
  protected ModelAndView register(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("register");
    String eventID = request.getParameter("eventid");
    model.addObject("id",eventID);
      Connection conn = DataServiceAPI.connect();
      String sql =  "Select eventName,reg_form_format From events Where eventID = '" + eventID + "' ";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if(result.next()) {
        model.addObject("name",result.getString("eventName"));
        if(result.getString("reg_form_format")!=null) {
            model.addObject("reg_form_format", "\"" + result.getString("reg_form_format") + "\"");
        }
        else{
            model.addObject("reg_form_format", "\"name\"");
        }
      }
      pstmt.close();
    return model;
  }

    @RequestMapping(value = "/register_done")
    protected ModelAndView register_done(HttpServletRequest request) throws Exception {

        System.out.println("wp");
        ModelAndView model = new ModelAndView("main");
        String eventID = request.getParameter("join");
        String data = "";
        int i = 0;
        String temp = request.getParameter("member" + Integer.toString(i));
        while(temp!=null){
            System.out.println("wp1");
            if(i == 0){
                data = data.concat(temp);
            }
            else{
                data = data.concat(";" + temp);
            }
            i++;
            temp = request.getParameter("member" + Integer.toString(i));
        }

            int p_id = ThreadLocalRandom.current().nextInt(1, 255);
            Connection conn = DataServiceAPI.connect();
            String sql =  "Select participantID From participants Where participantID = '" + p_id + "' ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();
            while (result.next()) {
                p_id = ThreadLocalRandom.current().nextInt(1, 255);
                sql =  "Select participantID From participants Where participantID = '" + p_id + "' ";
                pstmt = conn.prepareStatement(sql);
                result = pstmt.executeQuery();
            }
            sql = "Insert Into participants( participantID, participantName) Values (" + p_id +" , '" + data + "')";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
            sql = "Insert Into events_Participants(eventID,participantID) Values (" + eventID +" , '" + p_id + "')";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
            pstmt.close();

        return model;
    }

  @RequestMapping(value = "/manage")
  protected ModelAndView manage(HttpServletRequest request) throws Exception {
    ModelAndView model = new ModelAndView("manage");
    String username = (String)request.getSession().getAttribute("username");
    System.out.println(username);
    Connection conn = DataServiceAPI.connect();

    List<Event> events = new ArrayList<>();
    EventList eventList = new EventList();

    String sql = "Select * From events Where \"username\" = '" + username + "'";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet result = pstmt.executeQuery();

    DataServiceAPI d = new DataServiceAPI();
    d.addResultSetToEventList(result,events);
    pstmt.close();
    eventList.setEvents(events);

    model.addObject("eventList", eventList);
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
      if (!request.getParameter("startTime").equals("")) {
        sql = "UPDATE events SET eventStart = '" + request.getParameter("startTime")
                + "' WHERE eventID = '" + request.getParameter("update") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
      }
      if (!request.getParameter("endTime").equals("")) {
        sql = "UPDATE events SET eventEnd = '" + request.getParameter("endTime")
                + "' WHERE eventID = '" + request.getParameter("update") + "'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
      }
      if (!request.getParameter("location").equals("")) {
        sql = "UPDATE events SET eventLocation = '" + request.getParameter("eventLocation")
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
        model.addObject("startTime",result.getString("eventStart"));
        model.addObject("endTime",result.getString("eventEnd"));
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

  public String createTagSearch(int tag) {
    return "SELECT * FROM events WHERE tagids like '%" + tag + "%'";
  }

  @RequestMapping(value = "/browse")
  protected ModelAndView browse(HttpServletRequest request) throws Exception {
    boolean browsetags = false;
    ModelAndView model = new ModelAndView("browse");
    if (request.getParameter("search") == null) {
      for(String tag : tagToID.keySet()) {
        if(request.getParameter(tag) != null) {
          if(request.getParameter(tag).equals("on")) {
            int id = tagToID.get(tag);
            model.addObject("eventList", api.selectall(createTagSearch(id)));
            browsetags = true;
            break;
          }
        }
      }
      if(!browsetags) {
        model.addObject("eventList", api.selectall(selectUpcomingSql));
      }
    }

    else{
        try{
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

  private String translateTags (HttpServletRequest request) {
    StringBuilder builder = new StringBuilder();
    boolean firstTag = true;
    for(String tag : tagToID.keySet()) {
      if(request.getParameter(tag) != null) {
        if(request.getParameter(tag).equals("on")) {
          if(firstTag) {
            builder.append(tagToID.get(tag));
            firstTag = false;
          } else {
            builder.append(",").append(tagToID.get(tag));
          }
        }
      }
    }
    return builder.toString();
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
        String tagids = translateTags(request);
        api.insert(id, request.getParameter("ernm"), request.getParameter("date"), request.getParameter("startTime"), request.getParameter("endTime"),
                request.getParameter("location"), request.getParameter("About"), tagids);
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
        model.addObject("id", event_name);
        model.addObject("name", result.getString("eventName"));
        model.addObject("date", result.getString("eventDate"));
        model.addObject("startTime", result.getString("eventStart"));
        model.addObject("endTime",result.getString("eventEnd"));
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
