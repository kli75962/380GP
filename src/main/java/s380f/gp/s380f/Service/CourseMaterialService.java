package s380f.gp.s380f.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import s380f.gp.s380f.Repository.CourseMaterialRepository;
import s380f.gp.s380f.model.CourseMaterial;

@Service
public class CourseMaterialService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private CourseMaterialRepository courseMaterialRepository;

    public void saveCourseMaterial(Long lectureId, String fileName, String fileType, byte[] data) {
        CourseMaterial courseMaterial = new CourseMaterial();
        courseMaterial.setFileName(fileName);
        courseMaterial.setFileType(fileType);
        courseMaterial.setLectureId(lectureId);
        courseMaterial.setData(data);

        courseMaterialRepository.save(courseMaterial);
    }

    public void deleteMaterial(Long materialId) {
        courseMaterialRepository.deleteById(materialId);
    }
}
