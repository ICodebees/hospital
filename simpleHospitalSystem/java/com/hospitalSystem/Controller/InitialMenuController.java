package com.hospitalSystem.Controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hospitalSystem.Service.MedicalService;
import com.hospitalSystem.Service.UserModifyService;
import com.hospitalSystem.Service.UserService;
import com.hospitalSystem.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
@Controller
public class InitialMenuController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserModifyService userModifyService;
    @Autowired
    private MedicalService medicalService;
    @RequestMapping("RegisterMenu")
    public String RegisterMenu(){
        return "registerMenu";
    }
    @RequestMapping("Login")
    public String IsSign_in(){
        return "sign_in";
    }
    @RequestMapping("Login_in")
    public ModelAndView Login_in(User user, Model model, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        model.addAttribute(user);
        Cookie cookie = new Cookie("username",user.getUsername());
        if(Objects.equals(userService.verify_password(user.getUsername()),user.getPassword())){
            response.addCookie(cookie);
            mv.setViewName("Login_insuccess");

        }else{
            mv.setViewName("wrong_password");
        }
        return mv;
    }
    @RequestMapping("isLogin_in")
    public String isLogin_in(){
        return "personal_center";
    }
    @RequestMapping("Register")
    public String Register(User user) throws IOException {
        if(userService.findUserIsExist(user)==1){
            return "RegisterError";
        }
        userService.saveUser(user);
        return "RegisterSuccess";
    }
    @RequestMapping("personal")
    public String toPersonal(Model model, HttpServletRequest httpServletRequest){
        model.addAttribute("user",userService.findUserById(httpServletRequest.getParameter("username")));
        return"Personal_Information_Center";
    }
    @RequestMapping("queryOperative")
    public String toOperative(){
        return "Operation";
    }
    @RequestMapping("queryOperative1")
    @ResponseBody
    public Msg queryOperative(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Operation> lists = medicalService.findOperation();
        PageInfo page = new PageInfo(lists, 5);
        return Msg.success().add("pageInfo",page);
    }
    @ResponseBody
    @RequestMapping(value = "deleteAppointment")
    public Msg deleteAppointment( String username){
        boolean b = medicalService.checkUser(username);
        if(!b){
            medicalService.deleteAppointment(username);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
    @ResponseBody
    @RequestMapping("getDepartment")
    public Msg getDepartment(){
        List<Department>lists=medicalService.getDepartment();
        return Msg.success().add("depts",lists);
    }
    @RequestMapping(value = "saveAppointment",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveAppointment(Appointment appointment) {
        medicalService.saveAppointment(appointment);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping("checkUser")
    public Msg checkUser(String username){
        boolean b = medicalService.checkUser(username);
        if(b){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }
    @ResponseBody
    @RequestMapping("getAppointment")
    public Msg getAppointment(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Appointment>lists=medicalService.getAppointment();
        PageInfo page = new PageInfo(lists, 5);
        return Msg.success().add("pageInfo",page);
    }
    @RequestMapping("Appointment")
    public String toAppointment(){
        return"Appointment";
    }
    @RequestMapping("queryMedicine")
    public String toMedicine(){
        return "Medicine";
    }
    @ResponseBody
    @RequestMapping("queryMedicine1")
    public Msg queryMedicine(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Medicine>lists=medicalService.findMedicine();
        PageInfo page = new PageInfo(lists, 5);
        return Msg.success().add("pageInfo",page);
    }
    @RequestMapping("queryDoctor")
    public String toDoctor(){
        return "Doctor";
    }
    @RequestMapping("queryDoctor1")
    @ResponseBody
    public Msg queryDoctor(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Doctor> lists = medicalService.findDoctor();
        PageInfo page = new PageInfo(lists, 5);
        return Msg.success().add("pageInfo",page);
    }
    @RequestMapping(value = "updateAddress",method = RequestMethod.POST)
    @ResponseBody
    public Msg updateAddress(User user){
        userModifyService.UpdateAddress(user);
        return Msg.success();
    }
    @RequestMapping(value = "updatePassword",method = RequestMethod.POST)
    @ResponseBody
    public Msg updatePassword(User user){
        userModifyService.UpdatePassword(user);
        return Msg.success();
    }


}
