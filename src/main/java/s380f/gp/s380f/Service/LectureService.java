package s380f.gp.s380f.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import s380f.gp.s380f.Repository.CourseRepository;
import s380f.gp.s380f.Repository.LectureRepository;
import s380f.gp.s380f.model.Course;
import s380f.gp.s380f.model.Lecture;

import java.util.List;

@Service
public class LectureService {

    @Autowired
    private LectureRepository lectureRepository;
    private CourseRepository courseRepository;

    public List<Lecture> getLecturesByCourseId(Long courseId) {
        Course course = courseRepository.findById(courseId)
                .orElseThrow(() -> new RuntimeException("Course not found"));
        System.out.println(course);
        System.out.println("asdfasdfsadf86sa8f76as8f");
        return course.getLectures();
    }
}