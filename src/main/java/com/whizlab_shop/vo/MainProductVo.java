package com.whizlab_shop.vo;

import jdk.jfr.StackTrace;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class MainProductVo {
    private int mainSeq;
    private int prodSeq;
    private String imgPath;
    private int userseq;
    private int smallCateSeq;
    private String mainDate;
    private int mainEditor;
    private String mainEditDate;
    private String prodName;
    private String simpleExplain;
    private int prodSalePrice;

}
