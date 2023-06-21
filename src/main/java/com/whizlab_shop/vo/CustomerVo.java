package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

/*일반회원 정보 Vo
_whizlab_customer 테이블
* */
@Getter
@Setter
@Component
public class CustomerVo {
    private int customerSeq; //회원 시퀀스
    private String customerId;  //회원 아이디
    private String customerPw; //회원 비밀번호
    private String customerName; //회원 이름
    private String customerBday; //회원 생일
    private String customerMobile; //회원 전화번호
    private String customerEmail; //회원 이메일
    private int customerEditor; //회원 수정한 관리자
    private String customerEditDate; //회원 수정 날짜
    private String customerDel; //회원활동상태

    /*회원수정 페이지에 가져가는 회원등급*/
    private String customerGrade; //회원 등급 이름
    /*회원수정 업데이트 할 ajax로 가져가는 새로운 등급 시퀀스*/
    private int gradeSeq;
}
