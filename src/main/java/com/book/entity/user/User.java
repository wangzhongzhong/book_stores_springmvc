/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.entity.user;

import java.io.Serializable;
import java.util.List;

/**
 * @author 王忠忠
 * @著作时间 2017年12月17日 下午8:49:48
 * 本类User.java是描述:用来存放管理员和普通用户
 */
public class User implements Serializable {

	private static final long serialVersionUID = -6867209004393538609L;

	private Integer id;//
	private String userName;//用户名
	private String realName;//真实姓名
	private String password;//密码
	private Gender gender;//性别
	private String company;//所在公司
	private String email;//邮箱
	private String phone;//手机
	private Integer logo;//用户删除标志，【0，删除；1，存在】
	private Integer state;//身份【0(普通用户)，1(管理员)】
	private String img_path;//用户的头像
	
	private List<Address> address;//用户的收货地址
	
	
	
	/**
	 * @param userName
	 * @param realName
	 * @param password
	 * @param company
	 * @param email
	 * @param phone
	 * @param state
	 */
	public User(String userName, String realName, String password, String company, String email, String phone,
			Integer state) {
		this.userName = userName;
		this.realName = realName;
		this.password = password;
		this.company = company;
		this.email = email;
		this.phone = phone;
		this.state = state;
	}
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the realName
	 */
	public String getRealName() {
		return realName;
	}
	/**
	 * @param realName the realName to set
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the gender
	 */
	public Gender getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	/**
	 * @return the company
	 */
	public String getCompany() {
		return company;
	}
	/**
	 * @param company the company to set
	 */
	public void setCompany(String company) {
		this.company = company;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the state
	 */
	public Integer getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(Integer state) {
		this.state = state;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		final StringBuffer sb = new StringBuffer("User{");
		sb.append("id=").append(id);
		sb.append(", userName='").append(userName).append('\'');
		sb.append(", realName='").append(realName).append('\'');
		sb.append(", password='").append(password).append('\'');
		sb.append(", gender=").append(gender);
		sb.append(", company='").append(company).append('\'');
		sb.append(", email='").append(email).append('\'');
		sb.append(", phone='").append(phone).append('\'');
		sb.append(", logo=").append(logo);
		sb.append(", state=").append(state);
		sb.append(", img_path='").append(img_path).append('\'');
		sb.append('}');
		return sb.toString();
	}

	/**
	 * @param userName
	 * @param realName
	 * @param password
	 * @param gender
	 * @param company
	 * @param email
	 * @param phone
	 * @param state
	 */
	public User(String userName, String realName, String password, Gender gender, String company, String email,
			String phone, Integer state) {
		this.userName = userName;
		this.realName = realName;
		this.password = password;
		this.gender = gender;
		this.company = company;
		this.email = email;
		this.phone = phone;
		this.state = state;
	}
	/**
	 * 
	 */
	public User() {
	}
	public List<Address> getAddress() {
		return address;
	}
	public void setAddress(List<Address> address) {
		this.address = address;
	}
	public Integer getLogo() {
		return logo;
	}
	public void setLogo(Integer logo) {
		this.logo = logo;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	
	
	
	
	
}
