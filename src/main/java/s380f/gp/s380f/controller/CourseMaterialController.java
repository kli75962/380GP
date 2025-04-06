package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import s380f.gp.s380f.Service.CommentService;
import s380f.gp.s380f.Service.LectureNoteService;

import java.util.List;

@Controller
public class CourseMaterialController {

    @Autowired
    private LectureNoteService lectureNoteService;
    @Autowired
    private CommentService commentService;

    // Single method to handle both title and id
    @GetMapping("/courseMaterial")
    public String showCourseMaterial(@RequestParam("title") String title,
                                     @RequestParam("id") Long lectureId,
                                     Model model) {

        // Fetch the download links for the given lectureId
        List<String> downloadLinks = lectureNoteService.getDownloadLinksForLecture(lectureId);
        List<String> comments = commentService.getCommentsForLecture(lectureId);

        // Add lecture title and download links to the model
        model.addAttribute("lectureTitle", title);
        model.addAttribute("downloadLinks", downloadLinks);
        model.addAttribute("comments", comments);

        // Return the view name (courseMaterial.jsp)
        return "courseMaterial";
    }
}

