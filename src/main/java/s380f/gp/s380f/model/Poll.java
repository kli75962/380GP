package s380f.gp.s380f.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

@Entity
@Table(name = "poll")
public class Poll {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "question", nullable = false)
  private String question;

  @Column(name = "end_date", nullable = false)
  private LocalDateTime endDate;

  @Column(name = "created_at")
  private LocalDateTime createdAt;

  @OneToMany(mappedBy = "poll", cascade = CascadeType.ALL)
  @MapKey(name = "optionId")
  private Map<Integer, PollOption> options = new HashMap<>();

  @OneToMany(mappedBy = "poll", cascade = CascadeType.ALL, orphanRemoval = true)
  private List<PollComment> comments = new ArrayList<>();

  // Getters and Setters
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getQuestion() {
    return question;
  }

  public void setQuestion(String question) {
    this.question = question;
  }

  public LocalDateTime getEndDate() {
    return endDate;
  }

  public void setEndDate(LocalDateTime endDate) {
    this.endDate = endDate;
  }

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
  }

  public Map<Integer, PollOption> getOptions() {
    return options;
  }

  public void setOptions(Map<Integer, PollOption> options) {
    this.options = options;
  }

  public List<PollComment> getComments() {
    return comments;
  }

  public void setComments(List<PollComment> comments) {
    this.comments = comments;
  }
}