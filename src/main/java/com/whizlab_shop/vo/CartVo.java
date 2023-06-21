package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class CartVo {
    private int cartSeq;
    private int customerSeq;
    private int prodSeq;
    private int prodCount;
}
