package member.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	private String name;
	private int member_id;
	private String login_id;
	private String pwd;
	private String gender;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;
	private int report_count;
	private String blocked;
	private String role;
	private Date logtime;
}
