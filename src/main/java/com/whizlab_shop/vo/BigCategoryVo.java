package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class BigCategoryVo {
    private int bigCateSeq; //대분류 시퀀스
    private String bigCateName; //대분류 이름
    private int userSeq; //대분류 등록자
    private String bigCateDate; //대분류 등록일
    private int bigCateEditor; //대분류 수정인
    private String bigCateUpdate;  //대분류 수정일
}
