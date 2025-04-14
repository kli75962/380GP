package s380f.gp.s380f.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import s380f.gp.s380f.model.UserPollVote;
import java.util.List;

public interface UserPollVoteRepository extends JpaRepository<UserPollVote, Long> {
  List<UserPollVote> findByUserIdOrderByVotedAtDesc(Long userId);
  UserPollVote findByPollIdAndUserId(Long pollId, Long userId);
}