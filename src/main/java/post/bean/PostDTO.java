package post.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PostDTO {
	
	private int postId;						// 게시물 ID
    private int dishId;						// 음식 ID
    private int memberId;					// 사용자 ID
    private String title;					// 게시물 제목
    private String content;					// 게시물 내용
    private String imageFileName;			// UUID로 생성된 이미지 파일 이름
    private String imageOriginalFileName;	// 원래 이미지 파일 이름
    private Date createdAt;					// 게시물 작성 시간
<<<<<<< HEAD
    private String ceatedAtToString;		// 작성 시간을 문자열로
    private String name;					// 작성자 이름

=======
    private String createdAtToString;		// 작성 시간을 문자열로
    private String name; 					//작성자 이름
>>>>>>> 028fef8a2e3bfb6cd04f0621673e8ff324de4fcc
}
