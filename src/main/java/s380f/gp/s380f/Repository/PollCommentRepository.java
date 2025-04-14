// PollCommentRepository.java
package s380f.gp.s380f.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import s380f.gp.s380f.model.PollComment;
import java.util.List;

public interface PollCommentRepository extends JpaRepository<PollComment, Long> {
    List<PollComment> findByUserIdOrderByTimestampDesc(Long userId);
}