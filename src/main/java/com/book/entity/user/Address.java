/**
 * 此代码归杭州忠辉公司所有
 */
package com.book.entity.user;

import java.io.Serializable;

/**
 * @author 王忠忠
 * @著作时间 2017年12月17日 下午8:47:17
 * 本类Address.java是描述
 */
public class Address implements Serializable {

	private static final long serialVersionUID = 8371106602283747643L;

	private Integer id;
//	private String addr;//收货地址,收货地址分开来
	private String provice;//省份
	private String city;//市
	private String area;//区/县
	private String detail;//详细地址
	private String code;//邮编
	private String isDefault;//是否显示默认地址
	private String peceiver;//收货人
	private String tel;//收货人电话
	private Integer logo;//收货地址的标志，删除标志【0，删除；1，存在】
	private User user;//每个地址对应着一个用户
	/**
	 * 
	 */
	public Address() {
	}
	/**
	 * @param provice
	 * @param city
	 * @param area
	 * @param detail
	 * @param code
	 * @param isDefault
	 * @param peceiver
	 * @param tel
	 */
	public Address(String provice, String city, String area, String detail, String code, String isDefault,
			String peceiver, String tel) {
		this.provice = provice;
		this.city = city;
		this.area = area;
		this.detail = detail;
		this.code = code;
		this.isDefault = isDefault;
		this.peceiver = peceiver;
		this.tel = tel;
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
	 * @return the provice
	 */
	public String getProvice() {
		return provice;
	}
	/**
	 * @param provice the provice to set
	 */
	public void setProvice(String provice) {
		this.provice = provice;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the area
	 */
	public String getArea() {
		return area;
	}
	/**
	 * @param area the area to set
	 */
	public void setArea(String area) {
		this.area = area;
	}
	/**
	 * @return the detail
	 */
	public String getDetail() {
		return detail;
	}
	/**
	 * @param detail the detail to set
	 */
	public void setDetail(String detail) {
		this.detail = detail;
	}
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the isDefault
	 */
	public String getIsDefault() {
		return isDefault;
	}
	/**
	 * @param isDefault the isDefault to set
	 */
	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}
	/**
	 * @return the peceiver
	 */
	public String getPeceiver() {
		return peceiver;
	}
	/**
	 * @param peceiver the peceiver to set
	 */
	public void setPeceiver(String peceiver) {
		this.peceiver = peceiver;
	}
	/**
	 * @return the tel
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Address [id=");
		builder.append(id);
		builder.append(", provice=");
		builder.append(provice);
		builder.append(", city=");
		builder.append(city);
		builder.append(", area=");
		builder.append(area);
		builder.append(", detail=");
		builder.append(detail);
		builder.append(", code=");
		builder.append(code);
		builder.append(", isDefault=");
		builder.append(isDefault);
		builder.append(", peceiver=");
		builder.append(peceiver);
		builder.append(", tel=");
		builder.append(tel);
		builder.append("]");
		return builder.toString();
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Address other = (Address) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	public Integer getLogo() {
		return logo;
	}
	public void setLogo(Integer logo) {
		this.logo = logo;
	}
	
	
	
	
}
