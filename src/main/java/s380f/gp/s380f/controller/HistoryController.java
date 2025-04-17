package s380f.gp.s380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;
import s380f.gp.s380f.Service.PollService;
import s380f.gp.s380f.Service.CommentService;
import s380f.gp.s380f.Service.UserService;
import s380f.gp.s380f.model.UserPollVote;
import s380f.gp.s380f.model.PollComment;
import s380f.gp.s380f.model.Comment;
import s380f.gp.s380f.model.User;
import java.util.List;

@Controller
public class HistoryController {

    @Autowired
    private PollService pollService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;

    @GetMapping("/votinghistory")
    public String getVotingHistory(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        List<UserPollVote> votes = pollService.getUserVotingHistory(user.getId());
        model.addAttribute("votes", votes);
        return "votinghistory";
    }

    @GetMapping("/commenthistory")
    public String getCommentHistory(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        List<PollComment> pollComments = pollService.getUserPollCommentHistory(user.getId());
        List<Comment> lectureComments = commentService.getUserLectureCommentHistory(user.getName());
        model.addAttribute("pollComments", pollComments);
        model.addAttribute("lectureComments", lectureComments);
        return "commenthistory";
    }
}