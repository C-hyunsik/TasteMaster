package comment.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {

	private int commentId; // 댓글 ID
	private int postId; // 게시물 ID
	private int memberId; // 사용자 ID
	private String content; // 댓글 내용
	private Date createdAt; // 댓글 작성 시간
	private String createdAtToString; // 댓글 작성 시간
	private String name; 	//작성자 이름
}
