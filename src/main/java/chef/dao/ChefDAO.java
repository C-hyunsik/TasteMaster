package chef.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import chef.bean.ChefDTO;

@Mapper
public interface ChefDAO {
	
	public int apiChefUpload(ChefDTO chefDTO);

	// 쉐프 목록 조회
	public List<ChefDTO> apiChefList();

	// 특정 쉐프 정보 조회
	public ChefDTO apiChefGetDTO(int chefId);

	// 특정 쉐프 이미지 파일 이름 조회
	public String apiChefGetImageFileName(int chefId);
	
	public int apiChefUpdate(ChefDTO chefDTO, MultipartFile img);

	public int apiChefDelete(int chefId);


}