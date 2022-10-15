package com.entity;

public class BookDetails {

	
	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String bookCategory;
	private String status;
	private String photoName;
	private String userEmail;
	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDetails(String bookName, String author, String price, String bookCategory, String status,
			String photoName, String userEmail) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photoName = photoName;
		this.userEmail = userEmail;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", status=" + status + ", photoName=" + photoName + ", userEmail="
				+ userEmail + "]";
	}
	
	
}
