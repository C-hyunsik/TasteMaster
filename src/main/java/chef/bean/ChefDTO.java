package chef.bean;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChefDTO {
	private int chefId; // 쉐프 ID (자동 증가)
	private String chefName; // 쉐프 이름
	private String imageFileName; // UUID로 생성된 이미지 파일 이름 (네이버 NCP 저장)
	private String imageOriginalFileName; // 이미지의 원래 파일 이름


}
