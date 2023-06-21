package com.whizlab_shop.dao;

import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CustomerGradeVo;
import com.whizlab_shop.vo.CustomerVo;
import com.whizlab_shop.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class LoginDAOImpl implements LoginDAO{

    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whiz_shop.LoginMapper";

    @Override
    public int CheckIdDupicate(String customerId) throws Exception {
        return   session.selectOne(namespace+".checkIdDupicate", customerId);
    }

    @Override
    public CustomerVo CheckLogin(HashMap<String,String> map) throws Exception {
        return session.selectOne(namespace+".checkLogin", map);
    }

    @Override
    public int CustomerInsert(CustomerVo customerVo) throws Exception {
        return session.insert(namespace + ".customerInsert", customerVo);
    }

    @Override
    public int CheckUserIdDupicate(String userId) throws Exception {
        return session.selectOne(namespace+".checkUserIdDupicate", userId);
    }

    @Override
    public int UserInsert(UserVo userVo) throws Exception {
       return  session.insert(namespace+".userInsert", userVo);

    }

    @Override
    public UserVo CheckuserLogin(HashMap<String, String> map) throws Exception {
        return session.selectOne(namespace+".checkuserLogin", map);
    }

    @Override
    public int GetCustomerSeq(String customerId) throws Exception {
        return session.selectOne(namespace+".getCustomerSeq",customerId);
    }

    @Override
    public int AddressInsert(AddressVo addressVo) throws Exception {
        return session.insert(namespace+".addressInsert" ,addressVo);
    }

    @Override
    public int CustomerGrade(CustomerGradeVo customerGradeVo) throws Exception {
        return session.insert(namespace+".customerGrade", customerGradeVo);
    }

    @Override
    public int GetUserSeq(String userId) throws Exception {
        return session.selectOne(namespace+".getUserSeq", userId);
    }

    @Override
    public int UserRoleInsert(HashMap<String, Object> map) throws Exception {
        return session.insert(namespace+".userRoleInsert", map);
    }

}
