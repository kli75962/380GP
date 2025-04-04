package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;
import s380f.gp.s380f.Service.UserService;
import s380f.gp.s380f.model.User;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }

    @PostMapping("/register")
    public String processRegistration(@ModelAttribute("user") User user, Model model, HttpSession session) {
        try {
            userService.registerUser(
                    user.getUsername(),
                    user.getPassword(),
                    user.getName(),
                    user.getEmail(),
                    user.getPhoneNumber(),
                    user.getRole());

            User loggedInUser = userService.loginUser(user.getEmail(), user.getPassword());
            session.setAttribute("user", loggedInUser);

            return "redirect:/index";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "registration";
        }
    }
}
