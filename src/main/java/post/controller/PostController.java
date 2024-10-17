package post.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dish.bean.DishDTO;
import dish.service.DishService;
import naver.objectstorage.ObjectStorageService;
import post.bean.PostDTO;
import post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private DishService dishService;
	
    @Autowired
    private ObjectStorageService objectStorageService;
    
    private String bucketName = "bitcamp-9th-bucket-135";
    
	
	@RequestMapping(value="/page/post/dishPostList", method = RequestMethod.GET)
	public String pagePostDishPostList(@RequestParam(required = false, defaultValue = "1") String pg, @RequestParam(defaultValue = "1") int dishId,  Model model) {
		Map<String, Object> map2 = postService.dishPostList(pg, dishId);
		DishDTO dishInfo = dishService.apiDishInfo(dishId);
		model.addAttribute("map2",map2);
		model.addAttribute("dishInfo",dishInfo);
		model.addAttribute("pg",pg);
		model.addAttribute("dishId", dishId);
		return "/post/dishPostList";
	}
	
	@RequestMapping(value="/page/post/dishPostWrite", method = RequestMethod.GET)
	public String dishPostList(@RequestParam(value = "dishId", required = false, defaultValue = "1") int dishId, Model model) {
		model.addAttribute("dishId",dishId);
		return "/post/dishPostWrite";
	}
	@RequestMapping(value="/api/post/postWrite")
	public void apiPostPostWrite(@ModelAttribute PostDTO postDTO) {
		postService.postWrite(postDTO);
	}
	@RequestMapping(value="/page/post/dishpostwrite")
	public String pagePostDishPostWrite(@RequestParam(defaultValue = "1") int dishId,  Model model){
		model.addAttribute("dishId", dishId);
		return "/post/dishPostWrite";
	}
	
	
	 // 쉐프와 요리를 업로드하는 메서드
    @RequestMapping(value = "/api/post/upload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String uploadChefAndDishes(@RequestParam String title,
    		 @RequestParam String content,
    		 @RequestParam MultipartFile image,
    		 @RequestParam int dishId,
    		 HttpSession session) {
    	
    	int memeberId = (int) session.getAttribute("memberId");
    	
        String ImageFileName; // 이미지 파일 이름을 저장할 변수
        String ImageOriginalFileName; // 원본 파일 이름을 저장할 변수
 
        PostDTO post = new PostDTO();

       
        ImageOriginalFileName = image.getOriginalFilename();
        // Naver Cloud에 쉐프 이미지 업로드
        ImageFileName = objectStorageService.uploadFile(bucketName, "storage/", image);
        post.setTitle(title);
        post.setContent(content);
        post.setDishId(dishId);
        post.setMemberId(memeberId);
        post.setImageFileName(ImageFileName); // UUID로 생성된 파일 이름
        post.setImageOriginalFileName(ImageOriginalFileName); // 원본 파일 이름
        //위까지 클라우드에 오브젝트 스토리지에 이미지 등록
        
        
        postService.apiUploadPost(post); //게시글 정보 DB에 저장


        // 결과 메시지 구성
        return "게시글 등록";
    }
}
