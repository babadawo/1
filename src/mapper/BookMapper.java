package mapper;

import pojo.Book;
import pojo.Borrow;

import java.util.List;

public interface BookMapper {

    public List<Book> selectbook(Book book);
    public List<Book> selectOnlyBook(Book book);
    public void borrowbook(Borrow borrow);
    public void updatego (Integer book_id);
    public  void  addbook(String bookname,String bookwriter,String cbs);
    public void deletebook(Integer bookid);
    public void updatebook(String bookname,String bookwriter,String cbs,Integer bookid);
    public List<Book> selectbook1(Book book);
    public List<Book> selectbook2(Book book);
    public Book selectBookById(Integer id);
    public void deleteById(Integer id);
}
