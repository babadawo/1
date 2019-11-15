package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.Book;
import pojo.Borrow;
import pojo.User;
import service.BookDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    BookDao bookDao;
    @Autowired
    HttpServletRequest httpServletRequest;

    @RequestMapping("/billlist.action")
    public String billlist(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Book book, Model model) {
        ModelAndView modelAndView = new ModelAndView();
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectbook(book);
//        List<User> users=new ArrayList<>();
//        for (Book b:books
//        ) {
//            users.add(b.getUser());
//        }
        PageInfo pageInfo = new PageInfo(books);
        model.addAttribute("name", book.getName());
        model.addAttribute("writer", book.getWriter());
        model.addAttribute("go", book.getGo());
        model.addAttribute("billlist", pageInfo);
        // modelAndView.setViewName("billList.jsp");
        return "/billlListPage.action";
    }
    @RequestMapping("/billlListPage.action")
    public String billlListPage()
    {
      return "billList.jsp";
    }


    @RequestMapping("/bill2.action")
    public ModelAndView bill2(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Book book, Model model) {
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectOnlyBook(book);
        PageInfo pageInfo = new PageInfo(books);
        mav.addObject("pageInfo", pageInfo);
        mav.addObject("name", book.getName());
        mav.addObject("writer", book.getWriter());
        mav.addObject("go", book.getGo());
        mav.setViewName("bill2.jsp");
        return mav;
    }

    @RequestMapping("/borrow.action")
    public ModelAndView borrow(@RequestParam(required = false, defaultValue = "1", value = "page") int page, Integer bookid, Book book) {
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        System.out.println(userid);
        System.out.println(bookid);
        Borrow borrow = new Borrow();
        borrow.setUser_id(userid);
        borrow.setBook_id(bookid);
        bookDao.borrowbook(borrow);
        bookDao.updatego(bookid);
        ModelAndView mav = new ModelAndView();
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectOnlyBook(book);
        PageInfo pageInfo = new PageInfo(books);
        mav.addObject("pageInfo", pageInfo);
        mav.addObject("name", book.getName());
        mav.addObject("writer", book.getWriter());
        mav.addObject("pageInfo", pageInfo);
        mav.setViewName("bill2.jsp");
        return mav;
    }

    @RequestMapping("/addbook.action")
    public ModelAndView addbook(@RequestParam(required = false, defaultValue = "1", value = "page") int page, String bookname, String bookwriter, String cbs) {
        ModelAndView modelAndView = new ModelAndView();
        bookDao.addbook(bookname, bookwriter, cbs);
        Book book = null;
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectbook(book);
        List<User> users = new ArrayList<>();
        for (Book b : books
        ) {
            users.add(b.getUser());
        }
        PageInfo billlist = new PageInfo(books);
        modelAndView.addObject("billlist", billlist);
        modelAndView.setViewName("billList.jsp");
        return modelAndView;
    }

    @RequestMapping("/deletebook.action")
    public ModelAndView deletebook(@RequestParam(required = false, defaultValue = "1", value = "page") int page, String bookname, Integer bookid, Book book) {
        ModelAndView modelAndView = new ModelAndView();
        bookDao.deletebook(bookid);
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectbook(book);
        List<User> users = new ArrayList<>();
        for (Book b : books
        ) {
            users.add(b.getUser());
        }
        PageInfo pageInfo = new PageInfo(books);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("name", book.getName());
        modelAndView.addObject("writer", book.getWriter());
        modelAndView.addObject("billlist", pageInfo);
        modelAndView.setViewName("billList.jsp");
        return modelAndView;
    }

    @RequestMapping("/updatebook1.action")
    public ModelAndView updatebook1(Integer bookid) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("bookid", bookid);

        modelAndView.setViewName("billUpdate.jsp");
        return modelAndView;
    }

    @RequestMapping("/updatebook2.action")
    public ModelAndView updatebook2(@RequestParam(required = false, defaultValue = "1", value = "page") int page, String bookname, String bookwriter, String cbs, Integer bookid) {
        ModelAndView modelAndView = new ModelAndView();
        bookDao.updatebook(bookname, bookwriter, cbs, bookid);
        Book book = null;
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectbook(book);
        List<User> users = new ArrayList<>();
        for (Book b : books
        ) {
            users.add(b.getUser());
        }
        PageInfo pageInfo = new PageInfo(books);
        modelAndView.addObject("billlist", pageInfo);
        modelAndView.setViewName("billList.jsp");
        return modelAndView;
    }

    //    @RequestMapping("/selectbook1.action")
//    public ModelAndView selectbook1(@RequestParam(required = false,defaultValue = "1",value = "page") int page,Book book){
//        ModelAndView mav=new ModelAndView();
//        PageHelper.startPage(page,1);
//        List<Book> books = bookDao.selectbook1(book);
//        List<User> users=new ArrayList<>();
//        for (Book b:books
//        ) {
//            users.add(b.getUser());
//        }
//        PageInfo pageInfo=new PageInfo(books);
//        mav.addObject("billlist",pageInfo);
//        mav.addObject("name",book.getName());
//        mav.addObject("writer",book.getWriter());
//        mav.addObject("go",book.getGo());
//        mav.setViewName("billList.jsp");
//        return mav;
//    }
//
//    @RequestMapping("/selectbook2.action")
//    public ModelAndView selectbook2(@RequestParam(required = false,defaultValue = "1",value = "page") int page,Book book){
//        ModelAndView mav=new ModelAndView();
//        PageHelper.startPage(page,1);
//        List<Book> books = bookDao.selectbook2(book);
//        PageInfo pageInfo=new PageInfo(books);
//        mav.addObject("name",book.getName());
//        mav.addObject("writer",book.getWriter());
//        mav.addObject("go",book.getGo());
//        mav.addObject("pageInfo",pageInfo);
//        mav.setViewName("bill2.jsp");
//        return mav;
//    }
    @RequestMapping("/bookview.action")
    public ModelAndView bookview() {
        ModelAndView mav = new ModelAndView();
        String ID = httpServletRequest.getParameter("id");
        Integer id = Integer.parseInt(ID);
        Book book = bookDao.selectBookById(id);
        mav.addObject("book", book);
        mav.setViewName("billView.jsp");
        return mav;
    }

    @RequestMapping("updateById.action")
    public ModelAndView updateById(String id) {
        ModelAndView mav = new ModelAndView();
        Integer ID = Integer.parseInt(id);
        mav.addObject("bookid", ID);
        mav.setViewName("billUpdate.jsp");
        return mav;
    }

    @RequestMapping("deleteById.action")
    public ModelAndView deleteById(@RequestParam(required = false, defaultValue = "1", value = "page") int page, String id) {
        ModelAndView mav = new ModelAndView();
        Integer ID = Integer.parseInt(id);
        bookDao.deleteById(ID);
        Book book = null;
        PageHelper.startPage(page, 3);
        List<Book> books = bookDao.selectbook(book);
        List<User> users = new ArrayList<>();
        for (Book b : books
        ) {
            users.add(b.getUser());
        }
        PageInfo pageInfo = new PageInfo(books);
        mav.addObject("billlist", pageInfo);
        mav.setViewName("billList.jsp");
        return mav;
    }
}
