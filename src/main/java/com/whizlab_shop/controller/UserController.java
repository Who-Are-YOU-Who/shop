package com.whizlab_shop.controller;

import com.whizlab_shop.service.ProductService;
import com.whizlab_shop.service.UserService;
import com.whizlab_shop.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @RequestMapping("/managementPage")
    public String managementPage(HttpSession session) throws Exception {
        UserVo userVo = (UserVo)session.getAttribute("user");
        int userSeq = userVo.getUserSeq();
        List<UserRoleVo> rolelist = userService.SelectUserRole(userSeq);
        session.setAttribute("roleList", rolelist);
        return "/user/managementPage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView changeDashboard(int content) throws Exception {
        ModelAndView mav = new ModelAndView();
        if(content==5){  //문의관리
            mav.setViewName("/user/customerDashboard");
        }else if (content==6) { //리뷰관리
            mav.setViewName("/user/customerDashboard");
        } else if (content==8) { //회원관리-일반회원

            /*모든회원 select*/
            List<CustomerVo> customerList = new ArrayList<>();
            customerList = userService.SelectAllCustomer();

            /*모든 등급 select (회원등급 수정을 위한)*/
            List<GradeVo> gradeList = userService.SelectAllcustomerGrade();

            mav.addObject("gradeList", gradeList);
            mav.addObject("customerList",customerList);
            mav.setViewName("/user/editCustomer");
           // mav.setViewName("/user/customerDashboard");

        }  else if (content==9) { //회원관리-관리자

            /*모든관리자 select*/
            List<UserVo> userList = new ArrayList<>();
            userList = userService.SelectAllUser();
            int userSeq =  0;
            for(int i = 0; i < userList.size();i++){
                userSeq = userList.get(i).getUserSeq();
                List<UserRoleVo> userRoleVoList = userService.SelectAllUserRole(userSeq);  //관리자 권한 list가져오기
                userList.get(i).setUserRoleList(userRoleVoList);
            }

            /*권한 목록 가져오기*/
            List<UserRoleVo> roleList = userService.AllRole();

            mav.addObject("userList", userList);
            mav.addObject("roleList", roleList);
            mav.setViewName("/user/editUser");

            mav.setViewName("/user/editUser");
        } else if (content==10) { //상품등록
            /*대분류 목록 가져오기*/
            List<BigCategoryVo> bigCategoryVoList = productService.SelectAllBigCategory();
            mav.addObject("bigCategoryList",bigCategoryVoList);
            mav.setViewName("/user/insertProduct");
        } else if (content==11) { //상품수정
            /*대분류 목록 가져오기*/
            List<BigCategoryVo> bigCategoryVoList = productService.SelectAllBigCategory();
            mav.addObject("bigCategoryList",bigCategoryVoList);
            mav.setViewName("user/selectProductToEdit");
        } else if (content==12) { //재고단가관리
            /*등록된 재고 목록 가져오기*/
            List<ProductStkPrcVo> productStkPrcVoList = productService.SelectAllProductStckPrc();
            for(int i =0;i<productStkPrcVoList.size();i++){
                System.out.println("product name : "+productStkPrcVoList.get(i).getProdName());
                System.out.println("product stock : "+productStkPrcVoList.get(i).getProdStock());
            }
            mav.addObject("productStkPrcVoList",productStkPrcVoList);
            mav.setViewName("user/productStckPrice");
        } else if (content==13) { //판매등록

        } else if (content==14) { //주문내역
            mav.setViewName("/user/orderDashboard");
        }else if (content==15) { //주문취소

        }else if (content==16) { //취소완료

        }else if (content==17) { //반품관리

        }else if (content==18) { //반품완료

        }else if (content==19) { //메인페이지
        mav.setViewName("/user/editMainPage");
        }else if (content==20) { //카테고리

        }

        return mav;
    }

    @RequestMapping(value = "/editCustomer", method = {RequestMethod.POST , RequestMethod.GET})
    public ModelAndView editCustomer(CustomerVo customerVo, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> map = new HashMap<>();
        System.out.println("edit customer=====" + customerVo.getCustomerId());
        System.out.println("edit customer=====" + customerVo.getCustomerEditor());

        /*customer수정*/
        int result = userService.EditCustomer(customerVo);
        if(result!=0){
            System.out.println("success customer table update");
            /*회원등급수정*/
            CustomerGradeVo customerGradeVo = new CustomerGradeVo();
            customerGradeVo.setGradeSeq(customerVo.getGradeSeq());
            customerGradeVo.setCustomerSeq(customerVo.getCustomerSeq());
            customerGradeVo.setUserSeq(customerVo.getCustomerEditor());

            int g = userService.EditCustomerGrade(customerGradeVo);
            if(g!=0){
                System.out.println("success customer grade table update");
                mav.setViewName("redirect:/edit?content=8");
            }else{
                System.out.println("fail customer grade table update");
                mav.setViewName("/managementPage");
                mav.addObject("msg","회원 수정에 실패했습니다.");
            }

        }else{
            System.out.println("fail customer table update");
            mav.setViewName("/managementPage");
            mav.addObject("msg","회원 수정에 실패했습니다.");

        }

        return mav;
    }

    @RequestMapping(value = "/editUser", method = {RequestMethod.POST , RequestMethod.GET})
    public @ResponseBody Map<String,Object> editUser(@RequestBody List<userRoleChangeVo> list) throws Exception {
        System.out.println("edit User =================================");
        Map<String, Object> map = new HashMap<>();
        for(int i = 0; i < list.size();i++){
           System.out.println("userSeq : "+ list.get(i).getUserSeq()+", roleSeq : "+ list.get(i).getRoleSeq()+", roleShow : "+ list.get(i).getRoleShow());
        }

        int result = 0;
        result = userService.EditUserRole(list);
        if(result!=0){
            System.out.println("success user role update====");
            map.put("url","/edit?content=9");
        }else{
            System.out.println("fail user role update====");
            map.put("msg","관리자 수정에 실패했습니다.");
            map.put("url","/managementPage");
        }

        return map;

    }

    @RequestMapping(value = "/deleteCustomer", method = {RequestMethod.POST , RequestMethod.GET})
    public  @ResponseBody ModelAndView deleteCustomer(int customerSeq, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        int result = userService.DeleteCustomer(customerSeq);
        if(result !=0){
            mav.setViewName("/user/editCustomer");
            System.out.println("success delete customer!! next view name : "+mav.getViewName());
            return mav;
        }else {
            session.setAttribute("msg","회원 삭제에 실패했습니다.");
            mav.setViewName("redirect:/managementPage");
            return mav;
        }

    }


}
