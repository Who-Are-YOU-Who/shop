package com.whizlab_shop.dao;

import com.whizlab_shop.vo.*;

import java.util.List;

public interface UserDAO {
    public List<CustomerVo> SelectAllCustomer() throws Exception;

    public int EditCustomer(CustomerVo customerVo)throws Exception;

    public int DeleteCustomer(int customerSeq)throws Exception;

    public List<UserRoleVo> SelectUserRole(int userSeq)throws Exception;

    public List<Integer> SelectAllRole()throws Exception;

    public List<UserVo> SelectAllUser()throws Exception;

    public List<GradeVo> SelectAllcustomerGrade()throws Exception;

    public int EditCustomerGrade(CustomerGradeVo customerGradeVo)throws Exception;

    public List<UserRoleVo> SelectAllUserRole(int userSeq)throws Exception;

    public List<UserRoleVo> AllRole()throws Exception;


    public int EditUserRole(List<userRoleChangeVo> list)throws Exception;
}
