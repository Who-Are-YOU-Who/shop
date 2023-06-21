package com.whizlab_shop.vo;

import jdk.jfr.StackTrace;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class ProductImgVo {
    private int prodImgSeq;
    private int prodSeq;
    private String prodImgPath;
}
