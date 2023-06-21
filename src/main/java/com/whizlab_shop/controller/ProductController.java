package com.whizlab_shop.controller;

import com.whizlab_shop.service.ProductService;
import com.whizlab_shop.util.FileRenameUtil;
import com.whizlab_shop.util.FileResizeUtil;
import com.whizlab_shop.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    /*썸네일 서버에 올리는 매서드*/
    @ResponseBody
    @RequestMapping("/thumnailImage")
    public Map<String, Object> thumnailImage(MultipartFile file, HttpServletRequest req) throws Exception{

        String path = req.getSession().getServletContext().getRealPath("resources/image/");

        Map<String, Object> map = new HashMap<String, Object>();

        String ori_name = null;
        String file_name = null;

        String newPath = null;

        if(file != null){

            if(file.getSize() > 0){

                ori_name = file.getOriginalFilename();
                file_name = FileRenameUtil.checkSameFileName(ori_name, path);

                int idx = path.indexOf("image");

                newPath = path.substring(idx-1, path.length()) + file_name;

                System.out.println(path);

                String formatName = file_name.substring(file_name.lastIndexOf(".") + 1).toLowerCase();

                System.out.println(formatName);

                try{
                    file.transferTo(new File(path, file_name));
                    FileResizeUtil.resizeImageFile(file, path, formatName);
                } catch (Exception e){
                    e.printStackTrace();
                }

            } else {
                path = null;
            }

        }

        map.put("fileName", file_name);

        return map;

    }

    @RequestMapping("/selectSmallCategory")
    public @ResponseBody Map<String, Object> selectSmallCategory(int bigCateSeq) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        List<SmallCategoryVo> smallCategoryVoList = new ArrayList<>();
        smallCategoryVoList = productService.SelectSmallCategoryByBigCategory(bigCateSeq);

        map.put("smallCategoryVoList", smallCategoryVoList);

        return map;
    }

    @RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
    public String insertProduct(HttpSession session, ProductVo productVo, @RequestParam("files") MultipartFile[] file, String summernote ,HttpServletRequest req) throws Exception {

        System.out.println("start insert product=====");
        System.out.println(productVo.getProdName());
        System.out.println(summernote);
        System.out.println(file.length);

        UserVo userVo = (UserVo) session.getAttribute("user");
        productVo.setUserSeq(userVo.getUserSeq());
        System.out.println("user seq = " + productVo.getUserSeq());
        productVo.setProdSummernote(summernote);
        productVo.setProdDel("Y");
        int p = productService.InsertProduct(productVo); /*상품등록*/
        if(p!=0){
             System.out.println("insert product start=======");
            int prodSeq = 0;
            prodSeq = productService.SelectProdSeq(productVo.getProdName());
            System.out.println("prodSeq to insert images : " + prodSeq);

            if(prodSeq!=0){ /*시퀀스 찾았을때 이미지 등록*/

                try{
                    System.out.println("start insert imasges=======");
                        insertImages(file, prodSeq,req);
                        session.setAttribute("msg","상품등록에 성공했습니다. 재고 등록을 해 주세요.");
                        return "redirect:/edit?content=12";

                }catch (Exception e){/*상품등록 성공, 이미지 등록 실패*/
                    session.setAttribute("msg","상품 썸네일등록에 실패했습니다. 상품수정에서 이미지를 등록해 주세요.");
                    return "redirect:/edit?content=11";
                }
            }else{
                session.setAttribute("msg","상품등록 중에 에러가 발생했습니다. 다시 등록해주세요.");
                return "redirect:/edit?content=10";
            }

        }else{/*상품등록 실패*/
                session.setAttribute("msg","상품 등록에 실패했습니다.");
                 return "redirect:/edit?content=10";
        }


    }


    public void insertImages(MultipartFile[] fileList,int prodSeq,HttpServletRequest req) throws Exception {
        String path = req.getSession().getServletContext().getRealPath("resources/image/product/");
        String ori_name = null;
        String file_name = null;
        String newPath = null;

        for(int i =0;i<fileList.length;i++){
            MultipartFile file = fileList[i];
            System.out.println("image file name in roof : "+file.getOriginalFilename());
        if(file != null){
            System.out.println("image file name in not null : "+file.getOriginalFilename());

            if(file.getSize() > 0){
                System.out.println("image file name in size > 0 : "+file.getOriginalFilename());
                ori_name = file.getOriginalFilename();
                file_name = FileRenameUtil.checkSameFileName(ori_name, path);
                int idx = path.indexOf("image");

                /*파일 리네임*/
                file_name = "prod"+prodSeq+"img"+i;
                String formatName = file_name.substring(file_name.lastIndexOf(".") + 1).toLowerCase();
                System.out.println("image file renamed name : "+formatName);
                try{
                    file.transferTo(new File(path, formatName));
                } catch (Exception e){
                    e.printStackTrace();
                    System.out.println("image file insert fail ");
                    System.out.println(e);
                }
                System.out.println("Images to insert : prodSeq - "+prodSeq +" name - "+ formatName );
                ProductImgVo pImg = new ProductImgVo();
                pImg.setProdSeq(prodSeq);
                pImg.setProdImgPath(formatName);
                try{
                    productService.InsertProdImg(pImg);
                }catch (Exception e){
                    System.out.println("image insert fail ========");
                    System.out.println(e);
                }

            } else {

            }
        }
        }
    }




    @RequestMapping(value="/uploadSummernoteImageFile",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> uploadSummernoteImageFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String path = request.getSession().getServletContext().getRealPath("resources/image/");

        String ori_name = null;
        String file_name = null;

        String newPath = null;

        if(file != null){

            if(file.getSize() > 0){

                ori_name = file.getOriginalFilename();
                file_name = FileRenameUtil.checkSameFileName(ori_name, path);

                int idx = path.indexOf("image");

                newPath = path.substring(idx-1, path.length()) + file_name;

                System.out.println(path);

                String formatName = file_name.substring(file_name.lastIndexOf(".") + 1).toLowerCase();

                System.out.println(formatName);

                try{
                    file.transferTo(new File(path, file_name));
                } catch (Exception e){
                    e.printStackTrace();
                }


            } else {
                path = null;
            }

        }

        map.put("oriName", ori_name);
        map.put("newPath", newPath);

        return map;


    }

    @RequestMapping(value = "/searchProdByProdCode", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> searchProdByProdCode(String prodCode) throws Exception {  //상품 재고등록페이지/상품목록에서 검색시 사용
        Map<String, Object> map = new HashMap<>();
        prodCode = "%"+prodCode+"%";
        System.out.println("prodCode to select product: "+ prodCode);
        List<ProductVo> plist =  productService.SelectProductByProdCode(prodCode);
        for(int i =0; i<plist.size();i++){
            System.out.println("prodCode : "+plist.get(i).getProdCode());
            System.out.println("prodSeq : "+plist.get(i).getProdSeq());
        }
        map.put("plist", plist.toArray());
        return map;

    }

    @RequestMapping(value = "/searchProdCode", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> searchProdCode(String prodCode)throws Exception { //상품 재고등록페이지에서 상품코드 keydown시 유사한 상품코드 목록을 가져온다.
        Map<String, Object> map = new HashMap<>();
        prodCode = "%"+prodCode+"%";
        System.out.println("prodCode to select product: "+ prodCode);
        List<ProductVo> plist =  productService.SearchProdCode(prodCode);
        for(int i =0; i<plist.size();i++){
            System.out.println("prodCode : "+plist.get(i).getProdCode());
            System.out.println("prodSeq : "+plist.get(i).getProdSeq());
        }
        map.put("plist", plist.toArray());
        return map;
    }

    @RequestMapping(value = "/insertProductStckPrice", method = RequestMethod.POST)
    public String insertProductStckPrice(ProductStkPrcVo productStkPrc, HttpSession session) throws Exception {
        System.out.println("productSeq of Stock and price : "+ productStkPrc.getProdSeq());
        System.out.println("product Stock: "+ productStkPrc.getProdStock());
        System.out.println("product purchase price: "+ productStkPrc.getPurchasePrice());
        System.out.println("product sale price: "+ productStkPrc.getProdSalePrice());
        UserVo userVo = (UserVo) session.getAttribute("user");
        productStkPrc.setUserSeq(userVo.getUserSeq());

        int n = productService.InsertProductStckPrice(productStkPrc);
        if(n!=0){
            Map<String, Object> map = new HashMap<>();
            map.put("prodSeq",  productStkPrc.getProdSeq());
            map.put("prodDel","N");

            session.setAttribute("msg","재고/단가 등록을 완료했습니다.");

        }else{
            session.setAttribute("msg","재고/단가 등록에 실패했습니다. 다시 등록해 주세요.");
        }

        return "redirect:/edit?content=12";
    }

    @RequestMapping(value = "/editProductStockPrice", method = RequestMethod.POST)
    public void editProductStockPrice(String prodStkPrcSeq,String prodSeq, String prodStock,
                                        String purchasePrice, String prodSalePrice, HttpSession session) throws Exception {
        System.out.println("editProduct start========");
        int userSeq = 0;
        UserVo userVo = (UserVo) session.getAttribute("user");
        userSeq = userVo.getUserSeq();
        System.out.println(userSeq+","+prodStkPrcSeq+","+prodSeq+","+prodStock+","+purchasePrice+","+prodSalePrice);

        ProductStkPrcVo productStkPrc = new ProductStkPrcVo();
        productStkPrc.setProdStkPrcEditor(userSeq);
        productStkPrc.setProdStkPrcSeq(Integer.parseInt(prodStkPrcSeq));
        productStkPrc.setProdSeq(Integer.parseInt(prodSeq));
        productStkPrc.setProdStock(Integer.parseInt(prodStock));
        productStkPrc.setPurchasePrice(Integer.parseInt(purchasePrice));
        productStkPrc.setProdSalePrice(Integer.parseInt(prodSalePrice));

        System.out.println(productStkPrc.getProdStkPrcSeq()+","+productStkPrc.getPurchasePrice()+","+productStkPrc.getProdSalePrice());

        int n = productService.UpdateProductStockPrice(productStkPrc);
        if(n!=0){
            System.out.println("success update=========");
            session.setAttribute("msg","재고/단가 수정을 완료했습니다.");
        }else{
            System.out.println("fail update=========");
            session.setAttribute("msg","재고/단가 수정을 실패했습니다. 다시 시도해주세요.");
        }
        //return "redirect:/edit?content=12";
    }


    @RequestMapping(value = "/searchProdFromEditProduct", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> searchProdFromEditProduct(ProductSearchVo productSearchVo /*int bigCateSeq, int smallCateSeq, String minDate, String maxDate, String prodCode, String prodDel*/) throws Exception {
        Map<String, Object> map = new HashMap<>();
        System.out.println(productSearchVo.getBigCateSeq()+","+productSearchVo.getSmallCateSeq()+","+productSearchVo.getMinDate()+","+productSearchVo.getMaxDate()+","+productSearchVo.getProdCode()+","+productSearchVo.getProdDel());
        /*System.out.println(bigCateSeq+","+smallCateSeq+","+minDate+","+maxDate+","+prodCode+","+prodDel);*/

        List<ProductVo> productVoList = productService.SearchProduct(productSearchVo);

        for (int i =0; i<productVoList.size();i++){
            System.out.println(productVoList.get(i).getProdName());
            System.out.println(productVoList.get(i).getProdStock());
            System.out.println(productVoList.get(i).getProdImgPath());
        }
        map.put("plist", productVoList);

        return map;
    }

    @RequestMapping(value = "/editProduct", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView editProduct(int prodSeq) throws Exception {
        System.out.println("prod : "+prodSeq);
        ModelAndView mav  = new ModelAndView();
        ProductVo productVo = new ProductVo();
        productVo = productService.SelectProductByProdSeq(prodSeq);
        List<ProductImgVo> imgList = productService.SelectImages(prodSeq);
        productVo.setProdImgList(imgList);
        List<BigCategoryVo> bigCategoryVoList = productService.SelectAllBigCategory();

        mav.addObject("bigCategoryList",bigCategoryVoList);
        mav.addObject("productVo",productVo);
        mav.setViewName("/user/editProduct");

        return mav;
    }

    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(HttpSession session, ProductVo productVo, @RequestParam("files") MultipartFile[] file, String summernote ,HttpServletRequest req) throws Exception {

        System.out.println("start insert product=====");
        System.out.println(productVo.getProdName());
        System.out.println(summernote);
        System.out.println(file.length);

        UserVo userVo = (UserVo) session.getAttribute("user");
        productVo.setUserSeq(userVo.getUserSeq());
        System.out.println("user seq = " + productVo.getUserSeq());
        productVo.setProdSummernote(summernote);
        productVo.setProdDel("Y");
        int p = productService.InsertProduct(productVo); /*상품등록*/
        if(p!=0){
            System.out.println("insert product start=======");
            int prodSeq = 0;
            prodSeq = productService.SelectProdSeq(productVo.getProdName());
            System.out.println("prodSeq to insert images : " + prodSeq);

            if(prodSeq!=0){ /*시퀀스 찾았을때 이미지 등록*/

                try{
                    System.out.println("start insert imasges=======");
                    insertImages(file, prodSeq,req);
                    session.setAttribute("msg","상품등록에 성공했습니다. 재고 등록을 해 주세요.");
                    return "redirect:/edit?content=12";

                }catch (Exception e){/*상품등록 성공, 이미지 등록 실패*/
                    session.setAttribute("msg","상품 썸네일등록에 실패했습니다. 상품수정에서 이미지를 등록해 주세요.");
                    return "redirect:/edit?content=11";
                }
            }else{
                session.setAttribute("msg","상품등록 중에 에러가 발생했습니다. 다시 등록해주세요.");
                return "redirect:/edit?content=10";
            }

        }else{/*상품등록 실패*/
            session.setAttribute("msg","상품 등록에 실패했습니다.");
            return "redirect:/edit?content=10";
        }


    }

    @RequestMapping(value = "/SelectImagesByProdName", method = RequestMethod.POST)
    public @ResponseBody  Map<String, Object> SelectImagesByProdName(String prodName) throws Exception {
        Map<String, Object> map = new HashMap<>();
        System.out.println(prodName);
        List<ProductImgVo> productImgVoList = productService.SelectImagesByProdName(prodName);
        for(int i = 0; i< productImgVoList.size();i++){
            System.out.println("상품 : "+ productImgVoList.get(i).getProdSeq()+", 이미지 : "+productImgVoList.get(i).getProdImgPath());
        }
        map.put("imgList", productImgVoList);
        return map;
    }


    @RequestMapping(value = "/productDetail")
    public ModelAndView productDetail(int prod, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        int prodSeq = prod;
        ProductVo productVo = productService.SelectProductByProdSeq(prodSeq);

        if(productVo.getProdDel().equals("Y")||productVo.getProdStock()==0){
            //품절상태
            System.out.println("sold out=======");
            session.setAttribute("msg","해당상품은 품절되었습니다 ;/");
            mav.setViewName("redirect:/");
        }else{
            productVo.setProdImgList(productService.SelectImages(prodSeq));
            mav.addObject("productVo", productVo);
            mav.setViewName("/product/productDetail");
        }
        return mav;
    }



}
