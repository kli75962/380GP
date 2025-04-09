package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import s380f.gp.s380f.Service.UserService;
import s380f.gp.s380f.model.User;

@Controller
public class UserProfileController {

  @Autowired
  private UserService userService;

  @GetMapping("/userEdit")
  public String showUserEditForm(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) {
      return "redirect:/login";
    }
    model.addAttribute("user", user);
    return "userEdit";
  }

  @PostMapping("/updateProfile")
  public String updateProfile(
      @RequestParam String firstName,
      @RequestParam String lastName,
      @RequestParam String email,
      @RequestParam(required = false) String phone,
      @RequestParam(required = false) String password,
      @RequestParam(required = false) String confirmPassword,
      HttpSession session,
      RedirectAttributes redirectAttributes) {

    User user = (User) session.getAttribute("user");
    if (user == null) {
      return "redirect:/login";
    }

    try {
      String fullName = firstName + " " + lastName;
      userService.updateUserProfile(
          String.valueOf(user.getId()),
          fullName,
          email,
          phone,
          password,
          confirmPassword);

      User updatedUser = userService.getUserById(String.valueOf(user.getId()));
      session.setAttribute("user", updatedUser);

      redirectAttributes.addFlashAttribute("successMessage", "个人资料已更新");
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
    }

    return "redirect:/userEdit";
  }
}
