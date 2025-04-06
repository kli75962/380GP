package s380f.gp.s380f.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Method to fetch download links for a specific lecture
    public List<String> getCommentsForLecture(Long lectureId) {
        String sql = "SELECT content FROM comment WHERE lecture_id = ?";
        return jdbcTemplate.queryForList(sql, String.class, lectureId);
    }
}
