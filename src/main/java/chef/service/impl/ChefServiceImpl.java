package chef.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import chef.bean.ChefDTO;
import chef.dao.ChefDAO;
import chef.service.ChefService;

@Service
public class ChefServiceImpl implements ChefService {
    @Autowired
    private ChefDAO chefDAO;

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

	@Override
	public int apiChefUpdate(ChefDTO chefDTO, MultipartFile img) {
		// TODO Auto-generated method stub
		 return chefDAO.apiChefUpdate(chefDTO, img);
	}

	@Override
	public void apiChefDelete(int chefId) {
		 chefDAO.apiChefDelete(chefId);
	}

	
	public void apiUploadChef(ChefDTO chef) {
		chefDAO.apiUploadChef(chef);
		
	}

	@Override
	public int apiChefIdByName(String chefName) {
		 return chefDAO.apiChefIdByName(chefName);
	}
}
