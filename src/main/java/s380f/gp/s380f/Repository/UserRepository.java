package s380f.gp.s380f.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import s380f.gp.s380f.model.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByUsername(String username);

    Optional<User> findByEmail(String email);

    List<User> findByRoleNot(String role);
}