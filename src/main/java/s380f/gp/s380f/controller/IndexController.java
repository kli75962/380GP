package s380f.gp.s380f.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;
import s380f.gp.s380f.model.User;

@Controller
public class IndexController {

  @GetMapping({ "/", "/index" })
  public String home(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");
    model.addAttribute("user", user);
    return "index";
  }
}