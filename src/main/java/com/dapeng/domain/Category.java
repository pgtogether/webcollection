package com.dapeng.domain;

/**
 * 标签类别类
 * 
 * @author Administrator
 * 
 */
public class Category {

	private int categoryid;
	private String categoryname;
	private String categorytype;
	private int parentcategoryid;
	private String categorypermission;
	private String categorypsw;

	public int getCategoryid() {

		return categoryid;
	}

	public void setCategoryid(int categoryid) {

		this.categoryid = categoryid;
	}

	public String getCategoryname() {

		return categoryname;
	}

	public void setCategoryname(String categoryname) {

		this.categoryname = categoryname;
	}

	public String getCategorytype() {

		return categorytype;
	}

	public void setCategorytype(String categorytype) {

		this.categorytype = categorytype;
	}

	public int getParentcategoryid() {

		return parentcategoryid;
	}

	public void setParentcategoryid(int parentcategoryid) {

		this.parentcategoryid = parentcategoryid;
	}

	public String getCategorypermission() {

		return categorypermission;
	}

	public void setCategorypermission(String categorypermission) {

		this.categorypermission = categorypermission;
	}

	public String getCategorypsw() {

		return categorypsw;
	}

	public void setCategorypsw(String categorypsw) {

		this.categorypsw = categorypsw;
	}

}