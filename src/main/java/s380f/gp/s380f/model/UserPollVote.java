package s380f.gp.s380f.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_poll_vote")
public class UserPollVote {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "user_id", nullable = false)
  private Long userId;

  @ManyToOne
  @JoinColumn(name = "poll_id", nullable = false, insertable = false, updatable = false)
  private Poll poll;

  @ManyToOne
  @JoinColumns({
      @JoinColumn(name = "poll_id", referencedColumnName = "poll_id", nullable = false),
      @JoinColumn(name = "option_id", referencedColumnName = "option_id", nullable = false)
  })
  private PollOption option;

  @Column(name = "voted_at")
  private LocalDateTime votedAt;

  // Getters and Setters
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public Poll getPoll() {
    return poll;
  }

  public void setPoll(Poll poll) {
    this.poll = poll;
  }

  public PollOption getOption() {
    return option;
  }

  public void setOption(PollOption option) {
    this.option = option;
  }

  public LocalDateTime getVotedAt() {
    return votedAt;
  }

  public void setVotedAt(LocalDateTime votedAt) {
    this.votedAt = votedAt;
  }
}