package s380f.gp.s380f.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import s380f.gp.s380f.model.UserPollVote;

public interface UserPollVoteRepository extends JpaRepository<UserPollVote, Long> {
  UserPollVote findByPollIdAndUserId(Long pollId, Long userId);
}