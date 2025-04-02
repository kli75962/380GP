package s380f.gp.s380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import s380f.gp.s380f.model.User;

public interface UserRepository extends JpaRepository<User, String> {

}