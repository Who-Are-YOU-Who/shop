package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class ProductSearchVo {
    private int bigCateSeq;
    private int smallCateSeq;
    private String minDate;
    private String maxDate;
    private String prodCode;
    private String prodDel;
}
