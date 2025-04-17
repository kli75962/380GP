package s380f.gp.s380f.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import s380f.gp.s380f.Repository.PollRepository;
import s380f.gp.s380f.Repository.UserPollVoteRepository;
import s380f.gp.s380f.Repository.PollCommentRepository;
import s380f.gp.s380f.Repository.UserRepository;
import s380f.gp.s380f.model.Poll;
import s380f.gp.s380f.model.PollOption;
import s380f.gp.s380f.model.UserPollVote;
import s380f.gp.s380f.model.PollComment;
import s380f.gp.s380f.model.User;
import java.time.LocalDateTime;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

@Service
public class PollService {
  @Autowired
  private PollRepository pollRepository;

  @Autowired
  private UserPollVoteRepository userPollVoteRepository;

  @Autowired
  private PollCommentRepository pollCommentRepository;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private UserService userService;

  @Transactional
  public Poll createPoll(String question, String option1, String option2, String option3, String option4,
      String endDate) {
    Poll poll = new Poll();
    poll.setQuestion(question);
    poll.setEndDate(LocalDateTime.parse(endDate));
    poll.setCreatedAt(LocalDateTime.now());

    Poll savedPoll = pollRepository.save(poll);

    Map<Integer, PollOption> options = new HashMap<>();
    options.put(1, createOption(savedPoll, option1, 1L));
    options.put(2, createOption(savedPoll, option2, 2L));
    options.put(3, createOption(savedPoll, option3, 3L));
    options.put(4, createOption(savedPoll, option4, 4L));

    savedPoll.setOptions(options);
    return pollRepository.save(savedPoll);
  }

  private PollOption createOption(Poll poll, String optionText, Long optionId) {
    PollOption option = new PollOption();
    option.setOptionText(optionText);
    option.setPoll(poll);
    option.setOptionId(optionId);
    option.setVoteCount(0);
    return option;
  }

  public List<Poll> getAllPolls() {
    return pollRepository.findAll();
  }

  public Poll getPollById(Long id) {
    return pollRepository.findByIdWithOptionsAndComments(id);
  }

  @Transactional
  public void deletePoll(Long id) {
    pollRepository.deleteById(id);
  }

  public Long getUserVoteOptionId(Long pollId, Long userId) {
    UserPollVote vote = userPollVoteRepository.findByPollIdAndUserId(pollId, userId);
    return vote != null ? vote.getOption().getOptionId() : null;
  }

  @Transactional
  public void submitVote(Long pollId, Long userId, String optionId) {
    Poll poll = getPollById(pollId);
    if (poll == null) {
      throw new RuntimeException("Poll not found");
    }

    Long optionIdLong = Long.parseLong(optionId);
    PollOption selectedOption = poll.getOptions().get(optionIdLong);
    if (selectedOption == null) {
      throw new RuntimeException("Invalid option selected");
    }

    UserPollVote existingVote = userPollVoteRepository.findByPollIdAndUserId(pollId, userId);
    if (existingVote != null) {
      PollOption oldOption = existingVote.getOption();
      oldOption.setVoteCount(oldOption.getVoteCount() - 1);
      existingVote.setOption(selectedOption);
      existingVote.setVotedAt(LocalDateTime.now());
    } else {
      UserPollVote vote = new UserPollVote();
      vote.setPoll(poll);
      vote.setOption(selectedOption);
      vote.setUserId(userId);
      vote.setVotedAt(LocalDateTime.now());
      userPollVoteRepository.save(vote);
    }

    selectedOption.setVoteCount(selectedOption.getVoteCount() + 1);
    pollRepository.save(poll);
  }

  @Transactional
  public void addComment(Long pollId, Long userId, String comment) {
    Poll poll = getPollById(pollId);
    if (poll == null) {
      throw new RuntimeException("Poll not found");
    }

    PollComment newComment = new PollComment();
    newComment.setPoll(poll);
    newComment.setUserId(userId);
    newComment.setContent(comment);
    newComment.setTimestamp(LocalDateTime.now());

    poll.getComments().add(newComment);
    pollRepository.save(poll);
  }

  public String getUserRole(Long userId) {
    User user = userService.getUserById(String.valueOf(userId));
    return user.getRole();
  }

  public String getUserName(Long userId) {
    User user = userService.getUserById(String.valueOf(userId));
    return user.getUsername();
  }

  // New methods for history
  public List<UserPollVote> getUserVotingHistory(Long userId) {
    return userPollVoteRepository.findByUserIdOrderByVotedAtDesc(userId);
  }

  public List<PollComment> getUserPollCommentHistory(Long userId) {
    return pollCommentRepository.findByUserIdOrderByTimestampDesc(userId);
  }

  @Transactional
  public void deletePollComment(Long commentId, Long userId) {
    PollComment comment = pollCommentRepository.findById(commentId)
        .orElseThrow(() -> new RuntimeException("Comment does not exist"));

    pollCommentRepository.delete(comment);
  }
}