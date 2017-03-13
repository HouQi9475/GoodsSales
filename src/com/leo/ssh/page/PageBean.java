package com.leo.ssh.page;

import java.util.ArrayList;
import java.util.List;

public class PageBean {
   private int totalRows; //总数据
   private int totalPages; //总页数
   private int currentPage;// 当前页数
   private int pageSizes; //每页数据
   private List list=new ArrayList();
public int getTotalRows() {
	return totalRows;
}
public void setTotalRows(int totalRows) {
	this.totalRows = totalRows;
}
public int getTotalPages() {
	return totalRows%pageSizes==0?totalRows/pageSizes:totalRows/pageSizes+1;
}
public void setTotalPages(int totalPages) {
	this.totalPages = totalPages;
}
public int getCurrentPage() {
	return currentPage;
}
public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}
public int getPageSizes() {
	return pageSizes;
}
public void setPageSizes(int pageSizes) {
	this.pageSizes = pageSizes;
}
public List getList() {
	return list;
}
public void setList(List list) {
	this.list = list;
}
}
