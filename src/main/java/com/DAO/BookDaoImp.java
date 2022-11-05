package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDaoImp implements BookDao {

	

	private Connection con;

	public BookDaoImp(Connection con) {
		super();
		this.con = con;
	}

	public boolean addBooks(BookDetails b) {
		boolean f = false;

		try {
			String sql = "insert into book_details(bookName,author,price,bookCatagory,status,photo,userEmail,stock,totalsales) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, b.getBookName());
			pt.setString(2, b.getAuthor());
			pt.setString(3, b.getPrice());
			pt.setString(4, b.getBookCategory());
			pt.setString(5, b.getStatus());
			pt.setString(6, b.getPhotoName());
			pt.setString(7, b.getUserEmail());
			pt.setInt(8, b.getStock());
			pt.setInt(9, 0);
			
			/*String sql1="insert into sales (bid,sales) values(?,?)";
			PreparedStatement pt1=con.prepareStatement(sql1);
			pt1.setInt(1, );*/

			int i = pt.executeUpdate();
			if (i == 1) {

				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<BookDetails> getAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details";
			PreparedStatement pt = con.prepareStatement(sql);

			ResultSet rs = pt.executeQuery();

			while (rs.next()) {

				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				list.add(b);
			}

		} catch (Exception e) {

		}

		return list;
	}

	public BookDetails getBooksById(int id) {

		BookDetails b = null;

		try {
			String sql = "select * from book_details where bookId=?";

			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, id);
			ResultSet rs = pt.executeQuery();

			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateBooks(BookDetails b) {
		boolean f = false;

		try {
			String sql = "update book_details set bookName=?,author=?,price=?,status=?,stock=stock+? where bookId=?";
			
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, b.getBookName());
			pt.setString(2, b.getAuthor());
			pt.setString(3, b.getPrice());
			pt.setString(4, b.getStatus());
			pt.setInt(5, b.getStock());
			pt.setInt(6, b.getBookId());

			int i = pt.executeUpdate();
			
			
			String sql1="update cart set bookName=?,author=?,price=? where bid=?";
			
			PreparedStatement pt1=con.prepareStatement(sql1);
			pt1.setString(1, b.getBookName());
			pt1.setString(2, b.getAuthor());
			pt1.setString(3, b.getPrice());
			pt1.setInt(4, b.getBookId());
			
			int j=pt1.executeUpdate();
			
			if (i > 0 && j>0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteBooks(int id) {
		boolean f = false;

		try {

			String sql1 = "delete from book_details where bookId=?";
			String sql = "delete book_details,cart from book_details INNER JOIN cart where book_details.bookId=cart.bid and book_details.bookId=?";
			PreparedStatement pt = con.prepareStatement(sql);
			PreparedStatement pt1 = con.prepareStatement(sql1);
			pt.setInt(1, id);
			pt1.setInt(1, id);
			int i = pt.executeUpdate();

			int j = pt1.executeUpdate();
			if (i > 0 || j == 1) {

				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<BookDetails> getNewBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where status=? ORDER BY rand()";
			PreparedStatement pt = con.prepareStatement(sql);
			// pt.setString(1, "Entertainment Book");
			pt.setString(1, "Active");
			ResultSet rs = pt.executeQuery();
			 int i = 1;
			while (rs.next()) {

				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				list.add(b);
				 i++;
				 System.out.println("i="+i);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetails> getEducationalBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where status=? and bookCatagory=? ORDER BY rand()";
			PreparedStatement pt = con.prepareStatement(sql);

			pt.setString(1, "Active");
			pt.setString(2, "Educational");
			ResultSet rs = pt.executeQuery();

			while (rs.next()) {

				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where status=? ORDER BY bookId desc";
			PreparedStatement pt = con.prepareStatement(sql);
			// pt.setString(1, "Entertainment Book");
			pt.setString(1, "Active");
			ResultSet rs = pt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 6) {

				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetails> getEntertainmentBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where status=? and bookCatagory=? ORDER BY rand()";
			PreparedStatement pt = con.prepareStatement(sql);
			// pt.setString(1, "Entertainment Book");
			pt.setString(1, "Active");
			pt.setString(2, "Entertainment");
			ResultSet rs = pt.executeQuery();
			// int i = 1;
			while (rs.next()) {

				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				// i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details where status=? and bookCatagory=? ORDER BY rand()";
			PreparedStatement pt = con.prepareStatement(sql);
			// pt.setString(1, "Entertainment Book");
			pt.setString(1, "Active");
			pt.setString(2, "Old Book");
			ResultSet rs = pt.executeQuery();
			// int i = 1;
			while (rs.next()) {

				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				// i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<BookDetails> getBookByOld(String email, String category) {
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details where bookCatagory=? and userEmail=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, category);
			pt.setString(2, email);
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean OldBookDelete(String category, String email,int bid) {
		boolean f = false;

		String sql = "delete from book_details where bookCatagory=? and userEmail=? and bookId=?";

		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, category);
			pt.setString(2, email);
			pt.setInt(3, bid);
			int i=pt.executeUpdate();
			
			if(i>0){
				f=true;
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}
	public List<BookDetails> getBooksBySearch(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {

			String sql = "select * from book_details where bookName like ? or author like ? or bookCatagory like ? and status=?" ;
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, "%"+ch+"%");
			pt.setString(2, "%"+ch+"%");
			pt.setString(3, "%"+ch+"%");
			pt.setString(4, "Active");
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<BookDetails> salesreport(){
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;

		try {
			String sql = "select * from book_details order by totalsales desc";
			PreparedStatement pt = con.prepareStatement(sql);

			ResultSet rs = pt.executeQuery();

			while (rs.next()) {

				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				b.setStock(rs.getInt(9));
				b.setTotalsales(rs.getInt(10));
				list.add(b);
			}

		} catch (Exception e) {

		}

		return list;
	}
}