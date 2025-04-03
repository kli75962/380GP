package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import s380f.gp.s380f.Service.UserService;
import s380f.gp.s380f.model.User;

@Controller
public class LoginController {

  @Autowired
  private UserService userService;

  @GetMapping("/login")
  public String showLoginForm() {
    return "signin";
  }

  @PostMapping("/login")
  public String processLogin(@RequestParam String email,
      @RequestParam String password,
      @RequestParam String role,
      Model model) {
    try {
      User user = userService.loginUser(email, password);
      if (user != null && user.getRole().equalsIgnoreCase(role)) {
        return "redirect:/" + role.toLowerCase() + "/index";
      } else {
        model.addAttribute("error", "Invalid credentials or role mismatch");
        return "signin";
      }
    } catch (RuntimeException e) {
      model.addAttribute("error", e.getMessage());
      return "signin";
    }
  }
}