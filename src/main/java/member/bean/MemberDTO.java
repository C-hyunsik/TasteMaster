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
	private String name;
	private int memberId;
	private String loginId;
	private String pwd;
	private String gender;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;
	private int reportCount;
	private String blocked;
	private String role;
	private Date logtime;
	
	 @JsonCreator
	    public MemberDTO(
	        @JsonProperty("name") String name,
	        @JsonProperty("loginId") String loginId,
	        @JsonProperty("pwd") String pwd,
	        @JsonProperty("gender") String gender,
	        @JsonProperty("email") String email,
	        @JsonProperty("tel1") String tel1,
	        @JsonProperty("tel2") String tel2,
	        @JsonProperty("tel3") String tel3,
	        @JsonProperty("role") String role) {
	        
	        this.name = name;
	        this.loginId = loginId;
	        this.pwd = pwd;
	        this.gender = gender;
	        this.email = email;
	        this.tel1 = tel1;
	        this.tel2 = tel2;
	        this.tel3 = tel3;
	        this.role = role;
	    }

}
