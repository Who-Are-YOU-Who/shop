package com.whizlab_shop.controller;

import com.whizlab_shop.service.CustomerService;
import com.whizlab_shop.service.ProductService;
import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CartVo;
import com.whizlab_shop.vo.CustomerVo;
import com.whizlab_shop.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/addCart")
    public @ResponseBody int addCart(int customerSeq, int prodSeq, int prodCount) throws Exception {
        System.out.println("add to cart===");
        System.out.println("customerSeq : "+ customerSeq +", prodSeq : "+prodSeq+", prodCount : "+ prodCount);
        CartVo cartVo = new CartVo();
        cartVo.setCustomerSeq(customerSeq);
        cartVo.setProdSeq(prodSeq);
        cartVo.setProdCount(prodCount);
        int n = customerService.AddCart(cartVo);

        return n;
    }

    @RequestMapping(value = "/gotoOrder")
    public ModelAndView gotoOrder(HttpSession session, int prodSeq, int prodCount) throws Exception {
        ModelAndView mav = new ModelAndView();
        System.out.println("add to order===");
        CustomerVo customerVo = (CustomerVo) session.getAttribute("customer");
        System.out.println("customerSeq : "+ customerVo.getCustomerSeq() +", prodSeq : "+prodSeq+", prodCount : "+ prodCount);
        int customerSeq = customerVo.getCustomerSeq();
        /*기본배송지*/
        Map<String, Object> map = new HashMap<>();
        map.put("customerSeq", customerSeq);
        map.put("addressName","기본");
        AddressVo addressVo = customerService.SelectAddress(map);
        /*상품정보*/
        ProductVo productVo = productService.SelectProductByProdSeq(prodSeq);
        if(productVo.getProdStock()==0){
            session.setAttribute("msg","죄송합니다. 해당 상품은 품절입니다.");
            mav.setViewName("redirect:/productDetail?prod="+prodSeq);
        }else{
            mav.addObject("addressVo",addressVo);
            mav.addObject("productVo",productVo);
            mav.addObject("prodCount",prodCount);
            mav.setViewName("/order/order");
        }

        return mav;
    }
}
