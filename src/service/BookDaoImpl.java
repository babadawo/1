package service;

import mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Book;
import pojo.Borrow;

import java.util.List;

@Service

public class BookDaoImpl implements BookDao {
    @Autowired
    BookMapper mapper;
    @Override
    public List<Book> selectbook(Book book) {
        return mapper.selectbook(book);
    }

    @Override
    public List<Book> selectOnlyBook(Book book) {
        return mapper.selectOnlyBook(book);
    }

    @Override
    public void borrowbook(Borrow borrow) {
        mapper.borrowbook(borrow);
    }

    @Override
    public void updatego(Integer book_id) {
        mapper.updatego(book_id);
    }

    @Override
    public void addbook(String bookname, String bookwriter, String cbs) {
        mapper.addbook(bookname,bookwriter,cbs);
    }

    @Override
    public void deletebook(Integer bookid) {
        mapper.deletebook(bookid);
    }

    @Override
    public void updatebook(String bookname, String bookwriter, String cbs, Integer bookid) {
        mapper.updatebook(bookname,bookwriter,cbs,bookid);
    }

    @Override
    public List<Book> selectbook1(Book book) {
       return mapper.selectbook1(book);
    }

    @Override
    public List<Book> selectbook2(Book book) {
        return mapper.selectbook2(book);
    }

    @Override
    public Book selectBookById(Integer id) {
        return mapper.selectBookById(id);
    }

    @Override
    public void deleteById(Integer id) {
        mapper.deleteById(id);
    }
}
