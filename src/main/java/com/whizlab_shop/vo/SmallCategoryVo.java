package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class SmallCategoryVo {
    private int smallCateSeq;  //소분류 시퀀스
    private int bigCateSeq;  //대분류 시퀀스
    private String smallCateName; //소분류 이름
    private int userSeq;  //등록자
    private String smallCateDate;  //소분루 등록일
    private int smallCateEditor; //소분류 수정인
    private String smallCateUpdate; //소분류 수정일
}
