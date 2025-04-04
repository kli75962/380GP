package s380f.gp.s380f.Service;

import s380f.gp.s380f.Repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import s380f.gp.s380f.model.User;

import java.util.Optional;

@Service
public class UserService {

        @Autowired
        private UserRepository userRepository;

        public void registerUser(String username, String password, String name, String email, String phone,
                        String role) {
                Optional<User> existing = userRepository.findByUsername(username);
                if (existing.isPresent()) {
                        throw new RuntimeException("Username already taken.");
                }
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setName(name);
                user.setEmail(email);
                user.setPhoneNumber(phone);
                user.setRole(role != null ? role : "STUDENT");
                userRepository.save(user);
        }

        public User loginUser(String email, String password) {

                Optional<User> userOpt = userRepository.findByEmail(email);
                if (userOpt.isEmpty()) {
                        throw new RuntimeException("No user found with this email");
                }
                User user = userOpt.get();
                if (!user.getPassword().equals(password)) {
                        throw new RuntimeException("Invalid password");
                }
                return user;
        }


}
