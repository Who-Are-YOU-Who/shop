package com.whizlab_shop.dao;

import com.whizlab_shop.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO{

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whiz_shop.UserMapper";

    @Override
    public List<CustomerVo> SelectAllCustomer() throws Exception {
        return session.selectList(namespace+".selectAllCustomer");
    }

    @Override
    public int EditCustomer(CustomerVo customerVo) throws Exception {
        return session.update(namespace+".editCustomer", customerVo);
    }

    @Override
    public int EditCustomerGrade(CustomerGradeVo customerGradeVo) throws Exception {
        return session.update(namespace+".editCustomerGrade", customerGradeVo);
    }

    @Override
    public List<UserRoleVo> SelectAllUserRole(int userSeq) throws Exception {
        return session.selectList(namespace +".selectAllUserRole", userSeq);
    }

    @Override
    public List<UserRoleVo> AllRole() throws Exception {
        return session.selectList(namespace+".allRole");
    }

    @Override
    public int EditUserRole(List<userRoleChangeVo> list) throws Exception {
        System.out.println("Role edit DAO==========================");
        return session.update(namespace+".editUserRole", list);
    }


    @Override
    public int DeleteCustomer(int customerSeq) throws Exception {
        return session.delete(namespace+".deleteCustomer", customerSeq);
    }

    @Override
    public List<UserRoleVo> SelectUserRole(int userSeq) throws Exception {
        return session.selectList(namespace+".selectUserRole", userSeq);
    }

    @Override
    public List<Integer> SelectAllRole() throws Exception {
        return session.selectList(namespace+".selectAllRole");
    }

    @Override
    public List<UserVo> SelectAllUser() throws Exception {
        return session.selectList(namespace+".selectAllUser");
    }

    @Override
    public List<GradeVo> SelectAllcustomerGrade() throws Exception {
        return session.selectList(namespace+".selectAllcustomerGrade");
    }


}
