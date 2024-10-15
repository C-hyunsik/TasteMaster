package chef.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chef.bean.ChefDTO;
import chef.dao.ChefDAO;
import chef.service.ChefService;

@Service
public class ChefServiceImpl implements ChefService {
    @Autowired
    private ChefDAO chefDAO;

    @Override
    public int apiChefUpload(ChefDTO chefDTO) {
        // 쉐프 정보를 DB에 삽입하고, 영향을 받은 행의 수를 반환
        
        return chefDAO.apiChefUpload(chefDTO); // 성공적으로 추가되었음을 나타냄. 추가적으로 처리할 경우 영향을 받은 행 수를 반환할 수 있음.
    }

    @Override
    public List<ChefDTO> apiChefList() {
        // 쉐프 목록을 DB에서 조회하여 반환
        return chefDAO.apiChefList();
    }

    @Override
    public ChefDTO apiChefGetDTO(int chefId) {
        // 특정 chefId에 대한 쉐프 정보를 DB에서 조회하여 반환
        return chefDAO.apiChefGetDTO(chefId);
    }

    @Override
    public String apiChefGetImageFileName(int chefId) {
        // 특정 chefId에 대한 이미지 파일 이름을 DB에서 조회하여 반환
        return chefDAO.apiChefGetImageFileName(chefId);
    }
}
