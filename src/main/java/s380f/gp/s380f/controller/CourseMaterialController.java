package s380f.gp.s380f.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import s380f.gp.s380f.Repository.CommentRepository;
import s380f.gp.s380f.Service.CommentService;
import s380f.gp.s380f.Service.LectureNoteService;
import s380f.gp.s380f.model.Comment;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CourseMaterialController {

    @Autowired
    private LectureNoteService lectureNoteService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private CommentRepository commentRepository;

    // Single method to handle both title and id
    @GetMapping("/courseMaterial")
    public String showCourseMaterial(@RequestParam("title") String title,
                                     @RequestParam("id") Long lectureId,
                                     Model model) {

        // Fetch the download links for the given lectureId
        List<String> downloadLinks = lectureNoteService.getDownloadLinksForLecture(lectureId);
        List<Comment> comments = commentRepository.findByLectureId(lectureId);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Customize the format as needed
        List<String> formattedTimestamps = new ArrayList<>();
        // Format each comment's timestamp and store it in the list
        for (Comment comment : comments) {
            // Ensure timestamp is a java.util.Date or java.sql.Timestamp if it's LocalDateTime
            String formattedTimestamp = sdf.format(Timestamp.valueOf(comment.getTimestamp()));
            formattedTimestamps.add(formattedTimestamp);
        }

        model.addAttribute("formattedTimestamps", formattedTimestamps);
        // Add lecture title and download links to the model
        model.addAttribute("lectureTitle", title);
        model.addAttribute("lectureId", lectureId);
        model.addAttribute("downloadLinks", downloadLinks);
        model.addAttribute("comments", comments);

        // Return the view name (courseMaterial.jsp)
        return "courseMaterial";
    }

    @PostMapping("/submitComment")
    public String submitComment(
            @RequestParam("comment") String commentText,
            @RequestParam("lectureId") Long lectureId,
            HttpSession session, Model model) {

        try {
            model.addAttribute("lectureId", lectureId);
            // Call the service method with session, lectureId, and commentText
            commentService.saveComment(session, lectureId, commentText);
            return "redirect:/courseMaterial?title=YourTitle&id=" + lectureId; // redirect to the material page
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage"; // or return to the same page with error message
        }
    }

}

