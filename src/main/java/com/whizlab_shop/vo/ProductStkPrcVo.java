package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class ProductStkPrcVo {
    private int prodStkPrcSeq;
    private int prodSeq;
    private int prodStock;
    private int purchasePrice;
    private int prodSalePrice;
    private String prodStkPrcDate;
    private String prodStkPrcUpdate;
    private int userSeq;
    private int prodStkPrcEditor;

    /*재고목록에 뿌리기 위해 join시 필요*/
    private String prodCode;
    private String prodName;
}
