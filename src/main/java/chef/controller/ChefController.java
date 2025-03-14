package chef.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import chef.bean.ChefDTO;
import chef.service.ChefService;
import dish.bean.DishDTO;
import dish.service.DishService;
import naver.objectstorage.ObjectStorageService;

@Controller
public class ChefController {

    @Autowired
    private ChefService chefService;
    @Autowired
    private DishService dishService;



    @Autowired
    private ObjectStorageService objectStorageService;
    
    private String bucketName = "bitcamp-9th-bucket-135";

    // 동적으로 셰프 리스트 출력
    @RequestMapping(value = "/")
    public ModelAndView chefList() {
        List<ChefDTO> chefList = chefService.apiChefList();
        ModelAndView mav = new ModelAndView("/index");
        mav.addObject("chefList", chefList);
        return mav;
    }
    
    @RequestMapping(value = "/page/chef/upload")
	public String pageChefUpload(HttpSession httpSession, HttpServletResponse response) throws IOException {
		String role = (String) httpSession.getAttribute("role");
	    if (role == null || role.equals("ADMIN") == false) {
	    	 response.sendRedirect("/TasteMasters/page/index"); // 메인 페이지로 리다이렉트
	    	 return null; // 리다이렉트 후 메서드를 종료
	    }
		return "/admin/chefUpload";

	}


    // 쉐프와 요리를 업로드하는 메서드
    @RequestMapping(value = "/api/chef/upload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String uploadChefAndDishes(@RequestParam String chefName,
    		 @RequestParam("dishName") List<String> dishNames, // 요리 이름 리스트
    		 @RequestParam("dishContent") List<String> dishContents, // 요리 설명 리스트
    		 @RequestParam("dishImg") List<MultipartFile> dishImages,
    		 @RequestParam("chefImg") MultipartFile chefImg, HttpSession session) {
    	
    	
        // 쉐프 이미지 업로드 처리
        //MultipartFile chefImage = chefUploadDTO.getChef().getImageFile();
        String chefImageFileName; // 이미지 파일 이름을 저장할 변수
        String chefImageOriginalFileName; // 원본 파일 이름을 저장할 변수

        
        /*
        <insert id="apiUploadChef" parameterType="chef.bean.ChefDTO">
        INSERT INTO chef (chef_name, image_fileName, image_original_fileName)
        VALUES (#{chefName}, #{imageFileName}, #{imageOriginalFileName})
    </insert>
        */
        
        
        
        ChefDTO chef = new ChefDTO();

       
        chefImageOriginalFileName = chefImg.getOriginalFilename();
        // Naver Cloud에 쉐프 이미지 업로드
        chefImageFileName = objectStorageService.uploadFile(bucketName, "storage/", chefImg);
        chef.setChefName(chefName);
        chef.setImageFileName(chefImageFileName); // UUID로 생성된 파일 이름
        chef.setImageOriginalFileName(chefImageOriginalFileName); // 원본 파일 이름
        //위까지 클라우드에 오브젝트 스토리지에 이미지 등록
        
        
        chefService.apiUploadChef(chef); // 쉐프 정보 DB에 저장
        
        int chefId = chefService.apiChefIdByName(chefName);
        
        
   
        
        // 요리 이미지와 정보를 DB에 저장
        List<DishDTO> dishList = new ArrayList<>();
        
        for (int i = 0; i < dishImages.size(); i++) {
            MultipartFile dishImage = dishImages.get(i);
            if (dishImage != null && !dishImage.isEmpty()) {
                String dishImageOriginalFileName = dishImage.getOriginalFilename();
                String dishImageFileName = null; // 변수 선언 위치 변경
                try {
                    // Naver Cloud에 요리 이미지 업로드
                    dishImageFileName = objectStorageService.uploadFile(bucketName, "storage/", dishImage);
                } catch (Exception e) {
                    e.printStackTrace();
                    return "요리 이미지 업로드 중 오류가 발생했습니다.";
                }

                // DishDTO 객체 생성 및 설정
                DishDTO dish = new DishDTO();
                dish.setDishName(dishNames.get(i)); // 요리 이름 설정
                dish.setDishContent(dishContents.get(i)); // 요리 설명 설정
                dish.setImageFileName(dishImageFileName); // UUID로 생성된 파일 이름
                dish.setImageOriginalFileName(dishImageOriginalFileName); // 원본 파일 이름
                dish.setChefId(chefId); // 쉐프 ID 설정

                // 요리 리스트에 추가
                dishList.add(dish);
            }
        }
        /*
        insert id="uploadDishes" parameterType="java.util.List">
        insert into dish (chef_id, dish_name, image_fileName, image_original_fileName)
        values 
        <foreach collection="list" item="dish" separator=",">
            (#{dish.chefId}, #{dish.dishName}, #{dish.imageFileName}, #{dish.imageOriginalFileName})
        </foreach>
    </insert>*/
        
        // 요리 정보를 DB에 저장
        dishService.uploadDishes(dishList);
		
        // 결과 메시지 구성
        return "셰프와 요리 정보가 성공적으로 업로드되었습니다.";
    }

    @RequestMapping(value = "/api/chef/delete", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String apiChefDelete(@RequestParam("chefId") int chefId) {
    	/*
    	List<DishDTO> dishList = dishService.getDishByChefId(chefId);
    	List<PostDTO> postList = postService.getPostByChefId(chefId);
    	
    	// 2. Naver Cloud에서 요리 및 게시물 이미지 삭제
        for (DishDTO dish : dishList) {
            if (dish.getImageFileName() != null) {
                objectStorageService.deleteFile(bucketName, "storage/" , dish.getImageFileName());
            }
        }
        for (PostDTO post : postList) {
            if (post.getImageFileName() != null) {
                objectStorageService.deleteFile(bucketName, "storage/" , post.getImageFileName());
            }
        }
    	*/
    	chefService.apiChefDelete(chefId);
    	
    	return "탈락되었습니다...";
    }
    
    @RequestMapping(value = "/page/admin/chefUpdate")
    public String ChefUpdate(@RequestParam String chefId, Model model) {
    	List<DishDTO> dishList = dishService.apiDishList(chefId);
    	ChefDTO chefInfo = chefService.apiChefGetDTO(Integer.parseInt(chefId));
    	model.addAttribute("dishList", dishList);
    	model.addAttribute("chefInfo", chefInfo);
    	
    	return "/admin/chefUpdate";
    }
    
    @RequestMapping(value = "/api/chef/chefImgUpdate", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String chefImgUpdate(@RequestParam int chefId, @RequestParam("chefImg") MultipartFile chefImg) {
        // 기존 이미지 파일 이름 가져오기
        String existingImageFileName = chefService.apiChefGetImageFileName(chefId);
        
        // Naver Cloud에서 기존 이미지 삭제
        if (existingImageFileName != null) {
            objectStorageService.deleteFile(bucketName, "storage/", existingImageFileName);
        }

        // 새로운 이미지 파일 이름 업로드
        String newImageFileName = objectStorageService.uploadFile(bucketName, "storage/", chefImg);
        
        Map<String, Object> params = new HashMap<>();
        params.put("chefId", chefId);
        params.put("newImageFileName", newImageFileName);
        params.put("originalFilename", chefImg.getOriginalFilename());

        // 쉐프 정보 업데이트
        chefService.apiupdateChefImageFileName(params);

        return "이미지가 성공적으로 업데이트되었습니다.";
    }
    
    @RequestMapping(value = "/api/chef/addOnlyDish", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public void addOnlyDish(@RequestParam int chefId,
					            @RequestParam("dishName") List<String> dishNames, // 요리 이름 리스트
					            @RequestParam("dishContent") List<String> dishContents, // 요리 설명 리스트
					            @RequestParam("dishImg") List<MultipartFile> dishImages) {
    	boolean isUpload;
    	
    	List<DishDTO> dishList = new ArrayList<>();

        for (int i = 0; i < dishNames.size(); i++) {
            DishDTO dish = new DishDTO();
            dish.setChefId(chefId); // 쉐프 ID 설정
            dish.setDishName(dishNames.get(i)); // 요리 이름 설정
            dish.setDishContent(dishContents.get(i)); // 요리 설명 설정

            if (dishImages.get(i) != null && !dishImages.get(i).isEmpty()) {
                MultipartFile dishImage = dishImages.get(i);
                String dishImageOriginalFileName = dishImage.getOriginalFilename();
                String dishImageFileName = null;

                try {
                    // Naver Cloud에 요리 이미지 업로드
                    dishImageFileName = objectStorageService.uploadFile(bucketName, "storage/", dishImage);
                } catch (Exception e) {
                    e.printStackTrace();
                    isUpload = false;
                }

                dish.setImageFileName(dishImageFileName); // UUID로 생성된 파일 이름
                dish.setImageOriginalFileName(dishImageOriginalFileName); // 원본 파일 이름
            }

            // 요리 리스트에 추가
            dishList.add(dish);
        }

        // 요리 정보를 DB에 저장
        dishService.uploadDishes(dishList);
    	
        isUpload = true; //이러면 좀 그렇지만...boolean 리턴으로 하나 새로 생성하긴...좀 그래서 걍 기존에 있는걸로 진행함...ㅎ
    }
}
