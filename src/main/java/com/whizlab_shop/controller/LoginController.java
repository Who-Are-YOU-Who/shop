package com.whizlab_shop.controller;

import com.whizlab_shop.service.LoginService;

import com.whizlab_shop.service.UserService;
import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CustomerGradeVo;
import com.whizlab_shop.vo.CustomerVo;
import com.whizlab_shop.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class LoginController {

    @Autowired
    LoginService loginservice;

    @Autowired
    UserService userService;

    /*회원가입 페이지*/
    @RequestMapping("/registerpage")
    public String registerpage(HttpSession session){
        return "/login/registerpage";
    }

    /*아이디 중복체크*/
    @RequestMapping(value = "/checkIdDupicate", method = RequestMethod.POST)
    public @ResponseBody int checkIdDupicate(String customerId) throws Exception {
        System.out.println("checkIdDupicate controller=======");

        int result = 0;
        result = loginservice.CheckIdDupicate(customerId);

        if(result==0){ //중복된 아이디 없음
            System.out.println("return true ... result  : "+ result);
            return result;
        }else{ //중복된 아이디 있음
            System.out.println("return false ... result  : "+ result);
            return result;
        }

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(CustomerVo customerVo, String address, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        System.out.println("start registering");
        System.out.println(customerVo.getCustomerId());
        System.out.println(customerVo.getCustomerPw());
        System.out.println(customerVo.getCustomerName());
        System.out.println(customerVo.getCustomerMobile());
        System.out.println(customerVo.getCustomerBday());
        System.out.println(customerVo.getCustomerEmail());
        System.out.println(address);
        AddressVo addressVo = new AddressVo();
        addressVo.setAddressName("기본");
        addressVo.setAddress(address);

        int ins = loginservice.CustomerInsert(customerVo);
        if(ins == 1){
            //회원시퀀스가져오기
            String customerId = customerVo.getCustomerId();
            int customerSeq = loginservice.GetCustomerSeq(customerId);
            //주소저장
            addressVo.setCustomerSeq(customerSeq);
            int ad = loginservice.AddressInsert(addressVo);
            if(ad ==1){
                //회원등급저장
                CustomerGradeVo customerGradeVo = new CustomerGradeVo();
                customerGradeVo.setCustomerSeq(customerSeq);
                customerGradeVo.setGradeSeq(1);
                int gr =loginservice.CustomerGrade(customerGradeVo);
                if(gr==1){
                    session.setAttribute("msg", "회원가입에 성공했습니다. ");
                    mav.setViewName("redirect:/login");
                }
            }

        }else{
            session.setAttribute("msg", "회원가입에 실패했습니다. ");
            mav.addObject("msg", "회원가입에 실패했습니다.  ");
            mav.setViewName("redirect:/registerpage");
        }
        return mav;
    }

    @RequestMapping("/login")
    public String login(){
        return "/login/login";
    }

    @RequestMapping("/checkLogin")
    public ModelAndView checkLogin(HttpServletRequest req, HttpServletResponse res, String customerId, String customerPw) throws Exception {
        ModelAndView mav = new ModelAndView();
        HttpSession session = req.getSession();
        System.out.println("id : "+ customerId + ", pw : "+ customerPw);

        HashMap<String, String> map = new HashMap<>();
        map.put("customerId",customerId);
        map.put("customerPw",customerPw);
        CustomerVo vo = loginservice.CheckLogin(map);

        if(vo!=null){
            session.setAttribute("customer", vo);
            mav.setViewName("redirect:/");
        }else{
            //아이디 존재 유무 확인
            int idchk = loginservice.CheckIdDupicate(customerId);

            if(idchk==1) { //아이디 있음
                session.setAttribute("msg", "비밀번호가 일치하지 않습니다. ");
            }else{//아이디 없음
                session.setAttribute("msg", "존재하지 않는 아이디 입니다.");
            }
            RedirectView redirectView = new RedirectView(); // redirect url 설정
            redirectView.setUrl("/login");
            redirectView.setExposeModelAttributes(false);
            System.out.println(session.getAttribute("msg"));
            mav.setView(redirectView);

        }

        return mav;

    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){

        ModelAndView model = new ModelAndView();

        session.removeAttribute("customer");
        session.removeAttribute("user");

        model.setViewName("redirect:/");

        return model;

    }

    @RequestMapping("/userRegisterpage")
    public String adminRegisterpage(HttpSession session){
        return "/login/userRegisterpage";
    }

    @RequestMapping(value = "/checkUserIdDupicate", method = RequestMethod.POST)
    public @ResponseBody int checkUserIdDupicate(String userId) throws Exception {
        int result = loginservice.CheckUserIdDupicate(userId);

        if(result==0){ //중복된 아이디 없음
            System.out.println("return true ... result  : "+ result);
            return result;
        }else{ //중복된 아이디 있음
            System.out.println("return false ... result  : "+ result);
            return result;
        }
    }

    /*관리자 회원가입*/
    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    public ModelAndView registerUser(UserVo userVo, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        //관리자 가입등록
        int a = loginservice.UserInsert(userVo);

        if(a==1){//등록 성공 했을 때
            //등록한 관리자 시퀀스 가져오기
            int seq = loginservice.GetUserSeq(userVo.getUserId());
            System.out.println("seq check =============" + seq);
            //role목록 가져오기
            List<Integer> roleList = new ArrayList<>();
            roleList = userService.SelectAllRole();
            System.out.println();

            //시퀀스로 권한 세팅
            HashMap<String, Object> map = new HashMap<>();
            map.put("userSeq",seq);
            map.put("roleList",roleList);
            int s = loginservice.UserRoleInsert(map); //유저시퀀스와 roleSeq목록 list 넘기기 **모든 roleSeq showMenu에 'N' 주기위함

            if(s==roleList.size()){//시퀀스 세팅 성공했을 때
                mav.setViewName("redirect:/userLogin");
            }else{//시퀀스 세팅 실패했을 때
                session.setAttribute("msg","회원가입에 실패했습니다.");
                mav.setViewName("redirect:/userRegisterpage");
            }

        }else{//등록 실패했을 때
            session.setAttribute("msg","회원가입에 실패했습니다.");
            mav.setViewName("redirect:/userRegisterpage");
        }
        
        return  mav;
    }

    @RequestMapping(value = "/userLogin")
    public String userLogin(HttpSession session){
        return "/login/userLogin";
    }

    @RequestMapping(value = "/userLoginCheck")
    public ModelAndView userLoginCheck(String userId, String userPw, HttpSession session) throws Exception {
        System.out.println("userId : " + userId+"userPw : "+userPw);
        ModelAndView mav = new ModelAndView();
        HashMap<String, String> map = new HashMap<>();
        map.put("userId",userId);
        map.put("userPw",userPw);
        UserVo vo = loginservice.CheckuserLogin(map);

        if(vo!=null){
            session.setAttribute("user", vo);
            mav.setViewName("redirect:/");
        }else{
            //아이디 존재 유무 확인
            int idchk = loginservice.CheckUserIdDupicate(userId);

            if(idchk==1) { //아이디 있음
                session.setAttribute("msg", "비밀번호가 일치하지 않습니다. ");
            }else{//아이디 없음
                session.setAttribute("msg", "존재하지 않는 아이디 입니다.");
            }
            RedirectView redirectView = new RedirectView(); // redirect url 설정
            redirectView.setUrl("/userLogin");
            redirectView.setExposeModelAttributes(false);
            System.out.println(session.getAttribute("msg"));
            mav.setView(redirectView);

        }

        return mav;
    }

    /*@RequestMapping("/editUser")
    public ModelAndView editUser(HttpSession session){

        ModelAndView model = new ModelAndView();

        UserVo user = (UserVo)session.getAttribute("user");

        String [] customerMobile = null;

        if(user.getCustomerMobile() != null){

            customerMobile = user.getCustomerMobile().split("-");

        }

        String [] managerMobile = null;
        if(user.getCustomerManagerMobile() != null){

            managerMobile = user.getCustomerManagerMobile().split("-");

        }

        String webPw = user.getCustomerWebPW();

        model.addObject("webPw", webPw);

        model.addObject("customerMobile", customerMobile);
        model.addObject("managerMobile", managerMobile);

        model.addObject("user", user);

        model.setViewName("/user/editUser");

        return model;

    }*/
    
    //유저 정보 수정
   /* @RequestMapping(value = "/userEditSend", method = {RequestMethod.POST})
    public Map<String, Object> userEditSend(String pass, String passChk, String customerMobile, String managerMobile, HttpSession session){
        
        Map<String, Object> map = new HashMap<String, Object>();

        UserVo user = (UserVo) session.getAttribute("user");

        PhoneUtil phone = new PhoneUtil();

        String custNumber = null;

        if(customerMobile != null){

            custNumber = phone.phoneRefactor(customerMobile);

        }

        String managerNumber = null;

        if(managerMobile != null){

            managerNumber = phone.phoneRefactor(managerMobile);

        }

        dao.editUser(custNumber, managerNumber, pass, user.getCustomerSeq());
        
        return map;
        
    }*/
}
