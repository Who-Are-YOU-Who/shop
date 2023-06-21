package com.whizlab_shop.dao;

import com.whizlab_shop.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductDAOImpl implements ProductDAO{

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whiz_shop.ProductMapper";

    @Override
    public List<BigCategoryVo> SelectAllBigCategory() throws Exception {
        return session.selectList(namespace +".selectAllBigCategory");
    }

    @Override
    public List<SmallCategoryVo> SelectAllSmallCategory() throws Exception {
        return session.selectList(namespace +".selectAllSmallCategory");
    }

    @Override
    public List<SmallCategoryVo> SelectSmallCategoryByBigCategory(int bigCateSeq) throws Exception {
        return session.selectList(namespace+".selectSmallCategoryByBigCategory", bigCateSeq);
    }

    @Override
    public int InsertProduct(ProductVo productVo) throws Exception {
        return session.insert(namespace+".insertProduct", productVo);
    }

    @Override
    public int SelectProdSeq(String prodName) throws Exception {
        return session.selectOne(namespace+".selectProdSeq", prodName);
    }

    @Override
    public int InsertProdImg(ProductImgVo pImg) throws Exception {
        return session.insert(namespace+".insertProdImg", pImg);
    }

    @Override
    public List<ProductVo> SelectProductByProdCode(String prodCode) throws Exception {
        return session.selectList(namespace+".selectProductByProdCode", prodCode);
    }

    @Override
    public int InsertProductStckPrice(ProductStkPrcVo productStkPrc) throws Exception {
        return session.insert(namespace +".insertProductStckPrice", productStkPrc);
    }

    @Override
    public List<ProductStkPrcVo> SelectAllProductStckPrc() throws Exception {
        return session.selectList(namespace +".selectAllProductStckPrc");
    }

    @Override
    public int UpdateProductStockPrice(ProductStkPrcVo productStkPrc) throws Exception {
        return session.update(namespace + ".updateProductStockPrice", productStkPrc);
    }

    @Override
    public List<ProductVo> SearchProduct(ProductSearchVo productSearchVo) throws Exception {
        return session.selectList(namespace+".searchProduct", productSearchVo);
    }

    @Override
    public ProductVo SelectProductByProdSeq(int prodSeq) throws Exception {
        return session.selectOne(namespace+ ".selectProductByProdSeq", prodSeq);
    }

    @Override
    public List<ProductImgVo> SelectImages(int prodSeq) throws Exception {
        return session.selectList(namespace+".selectImages", prodSeq);
    }

    @Override
    public List<ProductImgVo> SelectImagesByProdName(String prodName) throws Exception {
        return session.selectList(namespace+".selectImagesByProdName", prodName);
    }

    @Override
    public List<MainProductVo> MainPageProduct() throws Exception {
        return session.selectList(namespace+".mainPageProduct");
    }

    @Override
    public List<ProductVo> SearchProdCode(String prodCode) throws Exception {
        return session.selectList(namespace+".searchProdCode", prodCode);
    }

    @Override
    public int UpdateProductDel(Map<String, Object> map) throws Exception {
        return session.update(namespace+".updateProductDel",map);
    }

}
