package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;
import s380f.gp.s380f.Service.LectureService;
import s380f.gp.s380f.Service.PollService;
import s380f.gp.s380f.model.Lecture;
import s380f.gp.s380f.model.Poll;
import s380f.gp.s380f.model.User;

import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

@Controller
public class IndexController {

  @Autowired
  private LectureService lectureService;

  @Autowired
  private PollService pollService;

  @GetMapping({ "/", "/index" })
  public String home(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");
    List<Lecture> lectures = lectureService.getLecturesByCourseId(1L);
    List<Poll> polls = pollService.getAllPolls();

    model.addAttribute("polls", polls);
    model.addAttribute("user", user);

    session.setAttribute("lectures", lectures);
    return "index";
  }
}
