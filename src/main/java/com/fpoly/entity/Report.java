package com.fpoly.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Report {
	@Id
	String title; // title như vầy mà
	Long count;
	Date lastest;
	Date oldest;

	public Report() {

	}

	public Report(String title, Long count, Date lastest, Date oldest) {
		super();
		this.title = title;
		this.count = count;
		this.lastest = lastest;
		this.oldest = oldest;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Date getLastest() {
		return lastest;
	}

	public void setLastest(Date lastest) {
		this.lastest = lastest;
	}

	public Date getOldest() {
		return oldest;
	}

	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}

	
	

}
