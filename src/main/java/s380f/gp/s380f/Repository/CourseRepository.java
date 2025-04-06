package s380f.gp.s380f.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import s380f.gp.s380f.model.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {
    // You can add custom queries if needed, e.g.:
    // List<Course> findByTitleContaining(String keyword);
    Course findById(long courseId);
}
