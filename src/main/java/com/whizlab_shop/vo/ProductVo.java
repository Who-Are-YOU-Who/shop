package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.List;

@Getter
@Setter
@Component
public class ProductVo {
    private int prodSeq;
    private int smallCateSeq;
    private String prodCode;
    private String prodName;
    private String prodManufacturingCountry;
    private String prodManufacturingFactory;
    private String prodComponent;
    private int deliveryPrice;
    private String simpleExplain;
    private String regiDate;
    private String prodSummernote;
    private int starAverage;
    private int userSeq;
    private String prodEditDate;
    private int prodEditor;
    private String prodDel;

    /*��ǰ ����� ����Ʈ*/
    private List<ProductImgVo> prodImgList ;
    private int prodStock;
    private String prodImgPath;
    private int prodSalePrice;
}
