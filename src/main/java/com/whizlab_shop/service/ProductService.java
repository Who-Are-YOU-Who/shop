package com.whizlab_shop.service;

import com.whizlab_shop.vo.*;

import java.util.List;
import java.util.Map;

public interface ProductService {
    public List<BigCategoryVo> SelectAllBigCategory()throws Exception;

    public List<SmallCategoryVo> SelectAllSmallCategory()throws Exception;

    public List<SmallCategoryVo> SelectSmallCategoryByBigCategory(int bigCateSeq)throws Exception;

    public int InsertProduct(ProductVo productVo)throws Exception;

    public int SelectProdSeq(String prodName)throws Exception;

    public int InsertProdImg(ProductImgVo pImg)throws Exception;

    public List<ProductVo> SelectProductByProdCode(String prodCode)throws Exception;

    public int InsertProductStckPrice(ProductStkPrcVo productStkPrc)throws Exception;

    public List<ProductStkPrcVo> SelectAllProductStckPrc()throws Exception;

    public int UpdateProductStockPrice(ProductStkPrcVo productStkPrc)throws Exception;

    public List<ProductVo> SearchProduct(ProductSearchVo productSearchVo)throws Exception;

    public ProductVo SelectProductByProdSeq(int prodSeq)throws Exception;

    public List<ProductImgVo> SelectImages(int prodSeq)throws Exception;

    public List<ProductImgVo> SelectImagesByProdName(String prodName)throws Exception;

    public List<MainProductVo> MainPageProduct()throws Exception;

    public List<ProductVo> SearchProdCode(String prodCode)throws Exception;

    public int UpdateProductDel(Map<String, Object> map)throws Exception;
}
