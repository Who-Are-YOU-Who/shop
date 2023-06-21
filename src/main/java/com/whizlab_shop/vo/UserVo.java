package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Getter
@Setter
public class UserVo {
    private int userSeq ;
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String userMobile;
    private String userDel;
    private String userEditor;
    private String userEditDate;
    private String master;

    /*관리자 권한 list*/
    private List<UserRoleVo> userRoleList ;
}
