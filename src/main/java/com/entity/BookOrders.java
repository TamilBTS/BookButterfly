package com.entity;

import java.time.LocalDate;
import java.time.LocalTime;

public class BookOrders {
	
	private int id;
	private String orderId;
	private String username;
	private String email;
	private String phno;
	private String fullAddress;
	private String bookName;
	private String author;
	private Double price;
	private String paymentType;
	private String date;
	private String time;
	private String status;
	private int quantity;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String string) {
		this.time = string;
	}
	@Override
	public String toString() {
		return "BookOrders [id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email
				+ ", phno=" + phno + ", fullAddress=" + fullAddress + ", bookName=" + bookName + ", author=" + author
				+ ", price=" + price + ", paymentType=" + paymentType + ", date=" + date + ", time=" + time + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFullAddress() {
		return fullAddress;
	}
	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String string) {
		this.date = string;
	}
	
	
}
