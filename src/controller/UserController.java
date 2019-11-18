package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pojo.Book;
import pojo.User;
import service.UserDao;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import Exception.ParamErrorException;
@Controller
public class UserController {

    @Autowired
    UserDao userDao;
    @Autowired
    HttpServletRequest httpServletRequest;

    @RequestMapping("/loginPage.action")
    public String loginPage(){
        return "login.jsp";
    }

    @RequestMapping("/login.action")
    public String Login(String admin, String password, Model model) throws ParamErrorException {
        User user=new User();
        user.setAdmin(admin);
        user.setPassword(password);
        User user1 = userDao.login(user);
        HttpSession session=httpServletRequest.getSession();
        if(user1!=null){
            session.setAttribute("user",user1);
            return "redirect:frame.jsp";
        }else {
            model.addAttribute("msg","用户名或密码错误");
            return "login.jsp";
        }
}
    @RequestMapping("/userlist.action")
    public ModelAndView userlist(@RequestParam(required = false,defaultValue = "1",value = "page") int page,User user){
        ModelAndView mav=new ModelAndView();
        PageHelper.startPage(page,1);
        List<User> users = userDao.selectAllUser(user);
        PageInfo pageInfo=new PageInfo(users);
        mav.addObject("pageInfo",pageInfo);
        String name =user.getUsername();
        mav.addObject("name",name);
        mav.setViewName("userList.jsp");
        return mav;
    }

    @RequestMapping("/updatepwd.action")
    public String  updatepwd(String oldPassword,String newPassword,Model model){
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        if(oldPassword.equals(user.getPassword())){
            userDao.updatethispsw(newPassword,userid);
            user.setPassword(newPassword);
            model.addAttribute("msg","修改成功");
            return "updatePwd.jsp";
        }else {
            model.addAttribute("msg","两次密码不一致，请重新输入");
            return "updatePwd.jsp";
        }
    }
    @RequestMapping("/toadduser.action")
    public String toadduser(){
        return "userAdd.jsp";
    }
    @RequestMapping("/adduser.action")
    public ModelAndView adduser(@RequestParam(required = false,defaultValue = "1",value = "page") int page,String rpassword,User user){
        ModelAndView mav=new ModelAndView();
        if(user.getPassword().equals(rpassword)){
            userDao.adduser(user);
            User user1=null;
            PageHelper.startPage(page,1);
            List<User> users = userDao.selectAllUser(user1);
            PageInfo pageInfo=new PageInfo(users);
            mav.addObject("pageInfo",pageInfo);
            mav.setViewName("userList.jsp");
        }else {
            mav.addObject("msg","两次密码输入不一致，请重新输入");
            mav.setViewName("userAdd.jsp");
        }

        return mav;
    }
//    @RequestMapping("/selectuser.action")
//    public ModelAndView selectuser(User user){
//        ModelAndView mav=new ModelAndView();
//        List<User> users = userDao.selectuser(user);
//        mav.addObject("users",users);
//        mav.addObject("username",user.getUsername());
//        mav.setViewName("userList.jsp");
//        return mav;
//    }
    @RequestMapping("/userview.action")
    public ModelAndView userview(){
        ModelAndView modelAndView=new ModelAndView();
        String ID = httpServletRequest.getParameter("id");
        Integer id=Integer.parseInt(ID);
        User user = userDao.selectUserById(id);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("userView.jsp");
        return modelAndView;
    }
    @RequestMapping("deleteUserById.action")
    public ModelAndView deleteUserById(@RequestParam(required = false,defaultValue = "1",value = "page") int page,String userid){
        ModelAndView modelAndView=new ModelAndView();
        Integer id=Integer.parseInt(userid);
        userDao.deleteUserById(id);
        User user=null;
        PageHelper.startPage(page,1);
        List<User> users = userDao.selectAllUser(user);
        PageInfo pageInfo=new PageInfo(users);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("userList.jsp");
        return modelAndView;
    }
    @RequestMapping("updateUserById1.action")
    public ModelAndView updateUserById1(String userid){
        ModelAndView modelAndView=new ModelAndView();
        Integer id=Integer.parseInt(userid);
        modelAndView.addObject("userid",userid);
        User user = userDao.selectUserById(id);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("userUpdate.jsp");
        return modelAndView;
    }
    @RequestMapping("updateUserById2.action")
    public ModelAndView updateUserById2(@RequestParam(required = false,defaultValue = "1",value = "page") int page,User user, MultipartFile picturename) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        String s= UUID.randomUUID().toString().replace("-","");
        String extension= FilenameUtils.getExtension(picturename.getOriginalFilename());
        s=s+"."+extension;
        user.setHeadpath(s);
        picturename.transferTo(new File("D:\\picture\\"+s));
        userDao.updateUserById2(user);
        PageHelper.startPage(page,1);
        List<User> users = userDao.selectAllUser(user);
        PageInfo pageInfo=new PageInfo(users);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("userList.jsp");
        return modelAndView;
    }
    @RequestMapping("updatePassWordById1")
    public ModelAndView updatePassWordById1(String userid){
        ModelAndView mav=new ModelAndView();
        Integer id=Integer.parseInt(userid);
        User user = userDao.selectUserById(id);
        mav.addObject("user",user);
        mav.setViewName("updatePwd2.jsp");
        return mav;
    }
    @RequestMapping("updatePassWordById2.action")
    public ModelAndView updatePassWordById2(@RequestParam(required = false,defaultValue = "1",value = "page") int page,String oldPassword,String newPassword ,String userid){
        ModelAndView mav=new ModelAndView();
        Integer id=Integer.parseInt(userid);
        User user = userDao.selectUserById(id);
        if(!(user.getPassword().equals(oldPassword))){
            mav.addObject("msg","旧密码错误");
            mav.addObject("user",user);
            mav.setViewName("updatePwd2.jsp");
        }else if((oldPassword.equals(newPassword))){
            mav.addObject("msg","两次密码输入不一致，请重新输入");
            mav.addObject("user",user);
            mav.setViewName("updatePwd2.jsp");
        }else {
            userDao.updatePassWordById2(newPassword,id);
            User user1=null;
            PageHelper.startPage(page,1);
            List<User> users = userDao.selectAllUser(user1);
            PageInfo pageInfo=new PageInfo(users);
            mav.addObject("pageInfo",pageInfo);
            mav.setViewName("userList.jsp");
        }
        return mav;
    }
    @RequestMapping("logout.action")
    public ModelAndView logout(){
        ModelAndView mav=new ModelAndView();
        HttpSession session=httpServletRequest.getSession();
        session.invalidate();
        mav.setViewName("login.jsp");
        return mav;

    }
    @ResponseBody
    @RequestMapping("/check.action")
    public String check(String admin){
        int i = userDao.check(admin);
        return (i>0)?"GG":"OJBK";
    }
}
