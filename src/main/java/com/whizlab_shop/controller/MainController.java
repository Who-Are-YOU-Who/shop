package com.whizlab_shop.controller;

import com.whizlab_shop.service.ProductService;
import com.whizlab_shop.vo.MainProductVo;
import com.whizlab_shop.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    ProductService productService;
    @RequestMapping("/")
    public ModelAndView main() throws Exception {
        ModelAndView mav = new ModelAndView();
        List<MainProductVo> mainProducList = productService.MainPageProduct();
        for(int i =0;i<mainProducList.size();i++){
            System.out.println(mainProducList.get(i).getProdName());
        }
        mav.addObject("mainProducList",mainProducList);
        mav.setViewName("/home");
        return mav;
    }
}
