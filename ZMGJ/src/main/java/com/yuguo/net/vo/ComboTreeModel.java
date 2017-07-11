package com.yuguo.net.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * easy ui combotree 值对象
 * 
 * @author AIDAN
 */
public class ComboTreeModel {
	private String id;
	private String text;
	List<ComboTreeModel> children = new ArrayList<ComboTreeModel>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<ComboTreeModel> getChildren() {
		return children;
	}

	public void setChildren(List<ComboTreeModel> children) {
		this.children = children;
	}
}
