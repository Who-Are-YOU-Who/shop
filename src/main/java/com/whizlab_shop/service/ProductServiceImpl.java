package com.whizlab_shop.service;

import com.whizlab_shop.dao.ProductDAO;
import com.whizlab_shop.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO dao;

    @Override
    public List<BigCategoryVo> SelectAllBigCategory() throws Exception {
        return dao.SelectAllBigCategory();
    }

    @Override
    public List<SmallCategoryVo> SelectAllSmallCategory() throws Exception {
        return dao.SelectAllSmallCategory();
    }

    @Override
    public List<SmallCategoryVo> SelectSmallCategoryByBigCategory(int bigCateSeq) throws Exception {
        return dao.SelectSmallCategoryByBigCategory(bigCateSeq);
    }

    @Override
    public int InsertProduct(ProductVo productVo) throws Exception {
        return dao.InsertProduct(productVo);
    }

    @Override
    public int SelectProdSeq(String prodName) throws Exception {
        return dao.SelectProdSeq(prodName);
    }

    @Override
    public int InsertProdImg(ProductImgVo pImg) throws Exception {
        return dao.InsertProdImg(pImg);
    }

    @Override
    public List<ProductVo> SelectProductByProdCode(String prodCode) throws Exception {
        return dao.SelectProductByProdCode(prodCode);
    }

    @Override
    public int InsertProductStckPrice(ProductStkPrcVo productStkPrc) throws Exception {
        return dao.InsertProductStckPrice(productStkPrc);
    }

    @Override
    public List<ProductStkPrcVo> SelectAllProductStckPrc() throws Exception {
        return dao.SelectAllProductStckPrc();
    }

    @Override
    public int UpdateProductStockPrice(ProductStkPrcVo productStkPrc) throws Exception {
        return dao.UpdateProductStockPrice(productStkPrc);
    }

    @Override
    public List<ProductVo> SearchProduct(ProductSearchVo productSearchVo) throws Exception {
        return dao.SearchProduct(productSearchVo);
    }

    @Override
    public ProductVo SelectProductByProdSeq(int prodSeq) throws Exception {
        return dao.SelectProductByProdSeq(prodSeq);
    }

    @Override
    public List<ProductImgVo> SelectImages(int prodSeq) throws Exception {
        return dao.SelectImages(prodSeq);
    }

    @Override
    public List<ProductImgVo> SelectImagesByProdName(String prodName) throws Exception {
        return dao.SelectImagesByProdName(prodName);
    }

    @Override
    public List<MainProductVo> MainPageProduct() throws Exception {
        return dao.MainPageProduct();
    }

    @Override
    public List<ProductVo> SearchProdCode(String prodCode) throws Exception {
        return dao.SearchProdCode(prodCode);
    }

    @Override
    public int UpdateProductDel(Map<String, Object> map) throws Exception {
        return dao.UpdateProductDel(map);
    }
}
