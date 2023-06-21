package com.whizlab_shop.service;

import com.whizlab_shop.dao.UserDAO;
import com.whizlab_shop.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO dao;

    @Override
    public List<CustomerVo> SelectAllCustomer() throws Exception {
        return dao.SelectAllCustomer();
    }

    @Override
    public int EditCustomer(CustomerVo customerVo) throws Exception {
        return dao.EditCustomer(customerVo);
    }

    @Override
    public int DeleteCustomer(int customerSeq) throws Exception {
        return dao.DeleteCustomer(customerSeq);
    }

    @Override
    public List<UserRoleVo> SelectUserRole(int userSeq) throws Exception {
        return dao.SelectUserRole(userSeq);
    }

    @Override
    public List<Integer> SelectAllRole() throws Exception {
        return dao.SelectAllRole();
    }

    @Override
    public List<UserVo> SelectAllUser() throws Exception {
        return dao.SelectAllUser();
    }

    @Override
    public List<GradeVo> SelectAllcustomerGrade() throws Exception {
        return dao.SelectAllcustomerGrade();
    }

    @Override
    public int EditCustomerGrade(CustomerGradeVo customerGradeVo) throws Exception {
        return dao.EditCustomerGrade(customerGradeVo);
    }

    @Override
    public List<UserRoleVo> SelectAllUserRole(int userSeq) throws Exception {
        return dao.SelectAllUserRole(userSeq);
    }

    @Override
    public List<UserRoleVo> AllRole() throws Exception {
        return dao.AllRole();
    }

    @Override
    public int EditUserRole(List<userRoleChangeVo> list) throws Exception {
        return dao.EditUserRole(list);
    }


}
