package s380f.gp.s380f.model;

import java.io.Serializable;

public class PollOptionId implements Serializable {
  private Poll poll;
  private Long optionId;

  public PollOptionId() {
  }

  public PollOptionId(Poll poll, Long optionId) {
    this.poll = poll;
    this.optionId = optionId;
  }

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

  @Override
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (o == null || getClass() != o.getClass())
      return false;
    PollOptionId that = (PollOptionId) o;
    return optionId.equals(that.optionId) && poll.equals(that.poll);
  }

  @Override
  public int hashCode() {
    return 31 * poll.hashCode() + optionId.hashCode();
  }
}