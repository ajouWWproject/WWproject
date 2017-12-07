package org.ajou.ww.model;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String profile_path;
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String password, String name, String phone, String profile_path) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.profile_path = profile_path;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", profile_path=" + profile_path + "]";
	}
	
	
}
