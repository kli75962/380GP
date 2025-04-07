package s380f.gp.s380f.Service;

import s380f.gp.s380f.Repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import s380f.gp.s380f.model.User;

import java.util.List;
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

        public User getUserById(String id) {
                Optional<User> userOpt = userRepository.findById(id);
                if (userOpt.isEmpty()) {
                        throw new RuntimeException("User not found");
                }
                return userOpt.get();
        }

        public void updateUserProfile(String id, String name, String email, String phone,
                        String password, String confirmPassword) {
                User user = getUserById(id);

                user.setName(name);
                user.setEmail(email);
                user.setPhoneNumber(phone);
                if (password != null && !password.trim().isEmpty()) {
                        if (!password.equals(confirmPassword)) {
                                throw new RuntimeException("Passwords do not match");
                        }
                        user.setPassword(password);
                }
                userRepository.save(user);
        }

        public List<User> getAllNonTeacherUsers() {
                return userRepository.findByRoleNot("TEACHER");
        }

        public void updateUserByTeacher(String id, String name, String email, String phone,
                        String role, String resetPassword, String newPassword) {
                User user = getUserById(id);

                if ("TEACHER".equals(role)) {
                        throw new RuntimeException("Cannot change user role to TEACHER");
                }

                user.setName(name);
                user.setEmail(email);
                user.setPhoneNumber(phone);
                user.setRole(role);

                if (resetPassword != null && resetPassword.equals("on") && newPassword != null
                                && !newPassword.trim().isEmpty()) {
                        user.setPassword(newPassword);
                }
                userRepository.save(user);
        }

        public void deleteUser(String id) {
                User user = getUserById(id);

                if ("TEACHER".equals(user.getRole())) {
                        throw new RuntimeException("Cannot delete TEACHER users");
                }

                userRepository.delete(user);
        }
}
