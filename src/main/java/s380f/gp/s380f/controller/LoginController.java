package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;
import s380f.gp.s380f.Service.UserService;
import s380f.gp.s380f.model.User;

@Controller
public class LoginController {

  @Autowired
  private UserService userService;

  @GetMapping("/login")
  public String showLoginForm(@RequestParam(required = false) String error, Model model) {
    if (error != null) {
      model.addAttribute("error", "Invalid email or password");
    }
    return "signin";
  }

  @PostMapping("/loginAc")
  public String processLogin(@RequestParam String email,
      @RequestParam String password,
      Model model,
      HttpSession session) {
    try {
      User user = userService.loginUser(email, password);
      if (user.getRole().equalsIgnoreCase("student")) {
        session.setAttribute("user", user);
        return "redirect:/index";
      } else {
        model.addAttribute("error", "Invalid credentials or role mismatch");
        return "signin";
      }
    } catch (RuntimeException e) {
      model.addAttribute("error", e.getMessage());
      return "signin";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/index";
  }
}