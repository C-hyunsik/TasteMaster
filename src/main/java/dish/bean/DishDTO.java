package dish.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class DishDTO {
	
	private int dishId;                     // 음식 ID (자동 증가)
    private int chefId;                     // 쉐프 ID (Chef 테이블과 연관)
    private String dishName;                // 음식 이름
    private String imageFileName;           // UUID로 생성된 이미지 파일 이름 (네이버 NCP 저장)
    private String imageOriginalFileName;   // 이미지의 원래 파일 이름
    private int deliciousCount;             // '맛있어요' 평가 개수
    private int makeEasyCount;              // '만들기 간단해요' 평가 개수

}
