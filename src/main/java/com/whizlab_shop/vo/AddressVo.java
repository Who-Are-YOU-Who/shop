package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class AddressVo {
    private int customerSeq;
    private int addressSeq;
    private String addressName;
    private String address;
}
