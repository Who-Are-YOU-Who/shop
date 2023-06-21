package com.whizlab_shop.service;

import com.whizlab_shop.dao.LoginDAO;
import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CustomerGradeVo;
import com.whizlab_shop.vo.CustomerVo;
import com.whizlab_shop.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDAO dao;

    @Override
    public int CheckIdDupicate(String customerId) throws Exception {
       return dao.CheckIdDupicate(customerId);
    }

    @Override
    public CustomerVo CheckLogin(HashMap<String, String> map) throws Exception {
        return dao.CheckLogin(map);
    }

    @Override
    public int CustomerInsert(CustomerVo customerVo) throws Exception {
        return dao.CustomerInsert(customerVo);
    }

    @Override
    public int CheckUserIdDupicate(String userId) throws Exception {
        return dao.CheckUserIdDupicate(userId);
    }

    @Override
    public int UserInsert(UserVo userVo) throws Exception {
        return dao.UserInsert(userVo);

    }

    @Override
    public UserVo CheckuserLogin(HashMap<String, String> map) throws Exception {
        return dao.CheckuserLogin(map);
    }

    @Override
    public int GetCustomerSeq(String customerId) throws Exception {
        return dao.GetCustomerSeq(customerId);
    }

    @Override
    public int AddressInsert(AddressVo addressVo) throws Exception {
        return dao.AddressInsert(addressVo);
    }

    @Override
    public int CustomerGrade(CustomerGradeVo customerGradeVo) throws Exception {
        return dao.CustomerGrade(customerGradeVo);
    }

    @Override
    public int GetUserSeq(String userId) throws Exception {
        return dao.GetUserSeq(userId);
    }

    @Override
    public int UserRoleInsert(HashMap<String, Object> map) throws Exception {
        return dao.UserRoleInsert(map);
    }

}
