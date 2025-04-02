package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import s380f.gp.s380f.model.User;
import s380f.gp.s380f.dao.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegistrationController {

  @Autowired
  private UserService userService;

  @GetMapping
  public String showRegistrationForm(Model model) {
    model.addAttribute("user", new User());
    return "registration";
  }

  @PostMapping
  public String registerUser(@Valid @ModelAttribute("user") User user,
      BindingResult result,
      RedirectAttributes redirectAttributes) {
    if (result.hasErrors()) {
      return "registration";
    }

    // 验证用户名是否已存在
    if (userService.isUsernameExists(user.getUsername())) {
      result.rejectValue("username", "error.user", "Username already exists");
      return "registration";
    }

    // 验证邮箱是否已存在
    if (userService.isEmailExists(user.getEmail())) {
      result.rejectValue("email", "error.user", "Email already exists");
      return "registration";
    }

    try {
      userService.registerUser(user);
      redirectAttributes.addFlashAttribute("success", "Registration successful! Please login.");
      return "redirect:/login";
    } catch (Exception e) {
      result.rejectValue("", "error.user", "Registration failed. Please try again.");
      return "registration";
    }
  }
}