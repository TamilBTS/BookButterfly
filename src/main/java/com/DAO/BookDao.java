package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDao {
	
	public boolean addBooks(BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBooksById(int id);
	
	public boolean updateBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBooks();
	
	public List<BookDetails> getEducationalBooks();
	
	public List<BookDetails> getEntertainmentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getBookByOld(String email,String category);
	
	public boolean OldBookDelete(String category,String email,int bid);
	
	public List<BookDetails> getBooksBySearch(String ch);
	
}
