package s380f.gp.s380f.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import s380f.gp.s380f.model.Comment;
import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findByLectureId(Long lectureId);
    List<Comment> findByUsernameOrderByTimestampDesc(String username);
}