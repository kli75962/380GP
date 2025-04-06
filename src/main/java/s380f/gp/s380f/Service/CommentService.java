package s380f.gp.s380f.Service;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import s380f.gp.s380f.Repository.CommentRepository;
import s380f.gp.s380f.Repository.LectureRepository;
import s380f.gp.s380f.model.Comment;
import s380f.gp.s380f.model.Lecture;
import s380f.gp.s380f.model.User;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CommentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private LectureRepository lectureRepository;

    public void saveComment(HttpSession session, Long lectureId, String commentText) {
        User user = (User) session.getAttribute("user");
        Lecture lecture = lectureRepository.findById(lectureId)
                .orElseThrow(() -> new RuntimeException("Lecture not found"));

        Comment comment = new Comment();
        comment.setUsername(user.getName());
        comment.setContent(commentText);
        comment.setTimestamp(LocalDateTime.now());
        comment.setLecture(lecture);

        commentRepository.save(comment);
    }


    // Method to fetch download links for a specific lecture
    public List<String> getCommentsForLecture(Long lectureId) {
        String sql = "SELECT content FROM comment WHERE lecture_id = ?";
        return jdbcTemplate.queryForList(sql, String.class, lectureId);
    }
}
