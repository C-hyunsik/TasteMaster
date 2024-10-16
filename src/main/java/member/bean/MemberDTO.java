package member.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class MemberDTO {
	private String name;	//이름
	private int memberId;	//회원번호
	private String loginId;	//아이디
	private String pwd;		//비밀번호
	private String gender;	//성별 M or F 체크박스
	private String email;	//이메일
	private String tel1;	//전화번호 ex)010
	private String tel2;	//중간 전화번호 ex)1234
	private String tel3;	//마지막 전화번호 ex)5678
	private int reportCount;//신고횟수
	private String blocked;	//차단 유무 Y or N
	private String role;	//관리자 역할 USER or ADMIN
	private Date logtime;	//회원가입시간
	

}
