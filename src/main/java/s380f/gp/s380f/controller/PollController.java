package s380f.gp.s380f.controller;

import s380f.gp.s380f.Service.PollService;
import s380f.gp.s380f.model.Poll;
import s380f.gp.s380f.model.User;
import s380f.gp.s380f.model.PollComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/polls")
public class PollController {
  @Autowired
  private PollService pollService;

  @GetMapping
  public String listPolls(Model model) {
    List<Poll> polls = pollService.getAllPolls();
    model.addAttribute("polls", polls);
    return "index";
  }

  @PostMapping("/add")
  public String addPoll(@RequestParam String question,
      @RequestParam String option1,
      @RequestParam String option2,
      @RequestParam String option3,
      @RequestParam String option4,
      @RequestParam String endDate) {
    pollService.createPoll(question, option1, option2, option3, option4, endDate);
    return "redirect:/polls";
  }

  @PostMapping("/delete")
  public String deletePoll(@RequestParam Long pollId) {
    pollService.deletePoll(pollId);
    return "redirect:/polls";
  }

  @GetMapping("/{id}")
  public String viewPoll(@PathVariable Long id, Model model, HttpSession session) {
    Poll poll = pollService.getPollById(id);
    if (poll == null) {
      return "redirect:/polls";
    }

    User user = (User) session.getAttribute("user");
    Long userId = user != null ? user.getId() : null;
    Long userVoteOptionId = userId != null ? pollService.getUserVoteOptionId(id, userId) : null;

    for (PollComment comment : poll.getComments()) {
      String userRole = pollService.getUserRole(comment.getUserId());
      String userName = pollService.getUserName(comment.getUserId());
      comment.setUserRole(userRole);
      comment.setUserName(userName);
    }

    model.addAttribute("poll", poll);
    model.addAttribute("userVoteOptionId", userVoteOptionId);
    return "poll";
  }

  @PostMapping("/vote")
  public String submitVote(@RequestParam("pollId") Long pollId,
      @RequestParam("optionId") String optionId,
      HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) {
      return "redirect:/login";
    }
    pollService.submitVote(pollId, user.getId(), optionId);
    return "redirect:/polls/" + pollId;
  }

  @PostMapping("/PollComment")
  public String submitComment(@RequestParam Long pollId, @RequestParam String comment, HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) {
      return "redirect:/login";
    }
    pollService.addComment(pollId, user.getId(), comment);
    return "redirect:/polls/" + pollId;
  }
}