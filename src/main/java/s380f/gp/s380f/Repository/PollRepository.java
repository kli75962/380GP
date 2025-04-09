package s380f.gp.s380f.Repository;

import s380f.gp.s380f.model.Poll;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PollRepository extends JpaRepository<Poll, Long> {
  @Query("SELECT MAX(p.id) FROM Poll p")
  Long findMaxId();

  @Query("SELECT p FROM Poll p LEFT JOIN FETCH p.options LEFT JOIN FETCH p.comments WHERE p.id = :id")
  Poll findByIdWithOptionsAndComments(@Param("id") Long id);
}