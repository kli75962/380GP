package s380f.gp.s380f.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import s380f.gp.s380f.Service.UserService;
import s380f.gp.s380f.model.User;

@Controller
public class UserManagementController {

  @Autowired
  private UserService userService;

  @GetMapping("/userManagement")
  public String showUserManagement(Model model, HttpSession session) {

    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || !"TEACHER".equals(currentUser.getRole())) {
      return "redirect:/login";
    }

    model.addAttribute("users", userService.getAllNonTeacherUsers());
    return "adminManagement";
  }

  @PostMapping("/userManagement/add")
  public String addUser(@RequestParam String username,
      @RequestParam String password,
      @RequestParam String name,
      @RequestParam String email,
      @RequestParam(required = false) String phone,
      @RequestParam String role,
      RedirectAttributes redirectAttributes) {
    try {
      role = "STUDENT";
      userService.registerUser(username, password, name, email, phone, role);
      redirectAttributes.addFlashAttribute("successMessage", "User added successfully");
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
    }
    return "redirect:/userManagement";
  }

  @PostMapping("/userManagement/update")
  public String updateUser(@RequestParam String id,
      @RequestParam String name,
      @RequestParam String email,
      @RequestParam(required = false) String phone,
      @RequestParam String role,
      @RequestParam(required = false) String resetPassword,
      @RequestParam(required = false) String newPassword,
      RedirectAttributes redirectAttributes) {
    try {
      userService.updateUserByTeacher(id, name, email, phone, role, resetPassword, newPassword);
      redirectAttributes.addFlashAttribute("successMessage", "User updated successfully");
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
    }
    return "redirect:/userManagement";
  }

  @PostMapping("/userManagement/delete")
  public String deleteUser(@RequestParam String id, RedirectAttributes redirectAttributes) {
    try {
      userService.deleteUser(id);
      redirectAttributes.addFlashAttribute("successMessage", "User deleted successfully");
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
    }
    return "redirect:/userManagement";
  }
}