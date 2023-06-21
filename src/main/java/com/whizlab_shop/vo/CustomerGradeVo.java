package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Setter
@Getter
@Component
public class CustomerGradeVo {
    private int customerSeq;
    private int gradeSeq;
    private int userSeq;
    private String cusGradeUpdate;
}
