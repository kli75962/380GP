package s380f.gp.s380f.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import s380f.gp.s380f.Repository.CommentRepository;
import s380f.gp.s380f.Repository.CourseMaterialRepository;
import s380f.gp.s380f.Service.CommentService;
import s380f.gp.s380f.Service.CourseMaterialService;
import s380f.gp.s380f.Service.LectureNoteService;
import s380f.gp.s380f.model.Comment;
import s380f.gp.s380f.model.CourseMaterial;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class CourseMaterialController {

    @Autowired
    private LectureNoteService lectureNoteService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private CourseMaterialService courseMaterialService;
    @Autowired
    private CourseMaterialRepository courseMaterialRepository;

    // Single method to handle both title and id
    @GetMapping("/courseMaterial")
    public String showCourseMaterial(@RequestParam("title") String title,
                                     @RequestParam("id") Long lectureId,
                                     Model model) {

        // Fetch the download links for the given lectureId
        List<String> downloadLinks = lectureNoteService.getDownloadLinksForLecture(lectureId);
        List<Comment> comments = commentRepository.findByLectureId(lectureId);
        List<CourseMaterial> materials = courseMaterialRepository.findByLectureId(lectureId);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // Customize the format as needed
        List<String> formattedTimestamps = new ArrayList<>();
        // Format each comment's timestamp and store it in the list
        for (Comment comment : comments) {
            // Ensure timestamp is a java.util.Date or java.sql.Timestamp if it's LocalDateTime
            String formattedTimestamp = sdf.format(Timestamp.valueOf(comment.getTimestamp()));
            formattedTimestamps.add(formattedTimestamp);
        }

        model.addAttribute("formattedTimestamps", formattedTimestamps);
        model.addAttribute("materials", materials);
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

    @PostMapping("/addMaterial")
    public String addMaterial(
            @RequestParam("file") MultipartFile file,
            @RequestParam("lectureId") Long lectureId,
            HttpSession session,
            Model model) {

        try {
            model.addAttribute("lectureId", lectureId);
            courseMaterialService.saveCourseMaterial(lectureId, file.getOriginalFilename(), file.getContentType(), file.getBytes());
            return "redirect:/courseMaterial?title=YourTitle&id=" + lectureId;


        } catch (IOException e) {
            e.printStackTrace(); // or log
            model.addAttribute("error", "Upload failed");
            return "courseMaterial"; // or error page
        }
    }

    @GetMapping("/downloadMaterial/{id}")
    public ResponseEntity<byte[]> downloadMaterial(@PathVariable Long id) {
        Optional<CourseMaterial> materialOpt = courseMaterialRepository.findById(id);

        if (materialOpt.isPresent()) {
            CourseMaterial material = materialOpt.get();
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + material.getFileName() + "\"")
                    .contentType(MediaType.parseMediaType(material.getFileType()))
                    .body(material.getData());
        }

        return ResponseEntity.notFound().build();
    }

}

