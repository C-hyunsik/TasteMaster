package chef.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import chef.bean.ChefDTO;
import chef.bean.ChefUploadDTO;
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


    // 쉐프와 요리를 업로드하는 메서드
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String uploadChefAndDishes(@ModelAttribute ChefUploadDTO chefUploadDTO,
                                       @RequestParam("dishImages[]") List<MultipartFile> dishImages,
                                       HttpSession session) {
        // 쉐프 이미지 업로드 처리
        MultipartFile chefImage = chefUploadDTO.getChef().getImageFile();
        String chefImageFileName = null; // 이미지 파일 이름을 저장할 변수
        String chefImageOriginalFileName = null; // 원본 파일 이름을 저장할 변수

        // 쉐프 정보 객체
        ChefDTO chef = chefUploadDTO.getChef(); // 여기서 chef 객체를 가져옵니다.

        if (chefImage != null && !chefImage.isEmpty()) {
            chefImageOriginalFileName = chefImage.getOriginalFilename();
            // Naver Cloud에 쉐프 이미지 업로드
            chefImageFileName = objectStorageService.uploadFile(bucketName, "storage/", chefImage);

            chef.setImageFileName(chefImageFileName); // UUID로 생성된 파일 이름
            chef.setImageOriginalFileName(chefImageOriginalFileName); // 원본 파일 이름
            chefService.apiUploadChef(chef); // 쉐프 정보 DB에 저장
        }

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
                dish.setDishName(chefUploadDTO.getDishes().get(i).getDishName()); // 요리 이름 설정
                dish.setImageFileName(dishImageFileName); // UUID로 생성된 파일 이름
                dish.setImageOriginalFileName(dishImageOriginalFileName); // 원본 파일 이름
                dish.setChefId(chef.getChefId()); // 쉐프 ID 설정

                // 요리 리스트에 추가
                dishList.add(dish);
            }
        }
        
        // 요리 정보를 DB에 저장
        dishService.uploadDishes(dishList);

        // 결과 메시지 구성
        return "쉐프와 요리 정보가 성공적으로 업로드되었습니다.";
    }
}
