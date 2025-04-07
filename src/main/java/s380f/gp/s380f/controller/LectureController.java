package s380f.gp.s380f.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import s380f.gp.s380f.Repository.CourseRepository;
import s380f.gp.s380f.Service.LectureService;
import s380f.gp.s380f.model.Course;

@Controller
public class LectureController {
    @Autowired
    private LectureService lectureService;

    @Autowired
    private CourseRepository courseRepository;

    @PostMapping("/addLecture")
    public String addLecture(@RequestParam("title") String title,
                              HttpSession session,
                              Model model) {
        try {
            Course course = courseRepository.findById(1L);
            lectureService.saveLecture(title, course);
            return "redirect:/index";
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage"; // or return to the same page with error message
        }
    }

    @PostMapping("/deleteLecture")
    public String deleteLecture(@RequestParam("lectureId") Long lectureId) {
        lectureService.deleteLectureById(lectureId);
        return "redirect:/index";
    }

}

