package chef.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import chef.bean.ChefDTO;

@Mapper
public interface ChefDAO {
	
	int apiChefUpload(ChefDTO chefDTO);

	// 쉐프 목록 조회
	List<ChefDTO> apiChefList();

	// 특정 쉐프 정보 조회
	ChefDTO apiChefGetDTO(int chefId);

	// 특정 쉐프 이미지 파일 이름 조회
	String apiChefGetImageFileName(int chefId);

}