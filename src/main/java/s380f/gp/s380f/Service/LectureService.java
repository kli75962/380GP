package s380f.gp.s380f.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import s380f.gp.s380f.Repository.LectureRepository;
import s380f.gp.s380f.model.Course;
import s380f.gp.s380f.model.Lecture;

import java.util.List;

@Service
public class LectureService {

    @Autowired
    private LectureRepository lectureRepository;

    public List<Lecture> getLecturesByCourseId(Long courseId) {
        return lectureRepository.findByCourseId(courseId);
    }

    public void saveLecture(String title, Course course) {
        Lecture lecture = new Lecture();
        lecture.setTitle(title);
        lecture.setCourse(course);

        lectureRepository.save(lecture);
    }
    public void deleteLectureById(Long lectureId) {
        lectureRepository.deleteById(lectureId);
    }

}