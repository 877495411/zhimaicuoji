package com.yuguo.net.vo;

public class SaleRankListVo {
	private Integer value;
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String name;
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "SaleRankListVo [value=" + value + ", name="
		+ name + "]";
	}
}
