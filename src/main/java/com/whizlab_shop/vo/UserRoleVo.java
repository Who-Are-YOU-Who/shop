package com.whizlab_shop.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class UserRoleVo {
    private int userSeq;
    private int roleSeq;
    private String roleShow;
    private String roleName;
    private String menuName;
    private int menuOrder;
    private int motherMenu;
}
