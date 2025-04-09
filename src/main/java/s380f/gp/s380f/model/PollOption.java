package s380f.gp.s380f.model;

import jakarta.persistence.*;

@Entity
@Table(name = "poll_option")
@IdClass(PollOptionId.class)
public class PollOption {
  @Id
  @ManyToOne
  @JoinColumn(name = "poll_id", nullable = false)
  private Poll poll;

  @Id
  @Column(name = "option_id", nullable = false)
  private Long optionId; // 1-4

  @Column(name = "option_text", nullable = false)
  private String optionText;

  @Column(name = "vote_count")
  private int voteCount;

  // Getters and Setters
  public Poll getPoll() {
    return poll;
  }

  public void setPoll(Poll poll) {
    this.poll = poll;
  }

  public Long getOptionId() {
    return optionId;
  }

  public void setOptionId(Long optionId) {
    this.optionId = optionId;
  }

  public String getOptionText() {
    return optionText;
  }

  public void setOptionText(String optionText) {
    this.optionText = optionText;
  }

  public int getVoteCount() {
    return voteCount;
  }

  public void setVoteCount(int voteCount) {
    this.voteCount = voteCount;
  }
}