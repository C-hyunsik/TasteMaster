package dish.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import chef.bean.ChefDTO;
import chef.service.ChefService;
import dish.bean.DishDTO;
import dish.service.DishService;
import naver.objectstorage.ObjectStorageService;

@Controller
public class DishController {

	@Autowired
	private DishService dishService;
	@Autowired
	private ChefService chefService;
	@Autowired
    private ObjectStorageService objectStorageService;
    
    private String bucketName = "bitcamp-9th-bucket-135";
    

    @RequestMapping(value = "/page/dish/dishList")
  	public String pageDishDishLists(@RequestParam String chefId, Model model) throws IOException {
    	
    	List<DishDTO> dishList = dishService.apiDishList(chefId);
    	ChefDTO chefInfo = chefService.apiChefGetDTO(Integer.parseInt(chefId));
    	model.addAttribute("dishList", dishList);
    	model.addAttribute("chefInfo", chefInfo);
  		return "/dish/dishList";
  	}
    
    @RequestMapping(value = "/page/dish/updateDishForm")
    public String updateDishForm(@RequestParam int dishId, Model model) {
    	DishDTO dishDTO = dishService.apiDishInfo(dishId);
    	
    	model.addAttribute("dishDTO", dishDTO);
    	
    	return "/dish/updateDishForm";
    }
    
    @RequestMapping(value = "/api/dish/update", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String apiDishUpdate(@RequestParam int dishId, 
                                @RequestParam String dishName, 
                                @RequestParam String dishContent, 
                                MultipartFile dishImage) {
        // 기존 요리 정보 가져오기
        DishDTO existingDish = dishService.apiDishInfo(dishId);
        
        // 기존 이미지 파일 이름 가져오기
        String existingImageFileName = existingDish.getImageFileName();

        // Naver Cloud에서 기존 이미지 삭제
        if (existingImageFileName != null) {
            objectStorageService.deleteFile(bucketName, "storage/", existingImageFileName);
        }

        // 새로운 이미지 파일 이름 업로드
        String newImageFileName = objectStorageService.uploadFile(bucketName, "storage/", dishImage);

        // DishDTO 업데이트
        existingDish.setDishName(dishName);
        existingDish.setDishContent(dishContent);
        existingDish.setImageFileName(newImageFileName); // UUID로 생성된 파일 이름
        existingDish.setImageOriginalFileName(dishImage.getOriginalFilename()); // 원본 파일 이름

        // 업데이트된 요리 정보를 DB에 저장
        dishService.apiUpdateDish(existingDish);

        return "요리 정보가 성공적으로 업데이트되었습니다.";
    }
    @RequestMapping(value="/api/dish/deliciousCount", method = RequestMethod.POST)
    @ResponseBody
    public void apiDishDeliciousCount(@RequestParam("dishId") int dishId) {
    	dishService.apiDishDeliciousCount(dishId);
    }
    
    @RequestMapping(value="/api/dish/easyCount", method = RequestMethod.POST)
    @ResponseBody
    public void apiDishEasyCount(@RequestParam("dishId") int dishId) {
    	dishService.apiDishEasyCount(dishId);
    }
    
    @RequestMapping(value="/api/dish/dishDelete")
    @ResponseBody
    public void apiDishDelete(@RequestParam("chefId") int chefId, @RequestParam("dishId") int dishId) {
    	Map map = new HashMap();
    	
    	// 기존 요리 정보 가져오기
        DishDTO existingDish = dishService.apiDishInfo(dishId);
        
        // 기존 이미지 파일 이름 가져오기
        String existingImageFileName = existingDish.getImageFileName();

        // Naver Cloud에서 기존 이미지 삭제
        if (existingImageFileName != null) {
            objectStorageService.deleteFile(bucketName, "storage/", existingImageFileName);
        }
    	
    	map.put("chefId", chefId);
    	map.put("dishId", dishId);
    	
    	dishService.apiDishDelete(map);
    }
}
