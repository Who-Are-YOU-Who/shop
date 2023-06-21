package com.whizlab_shop.dao;

import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CustomerGradeVo;
import com.whizlab_shop.vo.CustomerVo;
import com.whizlab_shop.vo.UserVo;

import java.util.HashMap;
import java.util.List;

public interface LoginDAO {
    public int CheckIdDupicate(String customerId) throws Exception;

    public CustomerVo CheckLogin(HashMap<String,String> map)throws Exception;

    public int CustomerInsert(CustomerVo customerVo)throws Exception;

    public int CheckUserIdDupicate(String userId)throws Exception;

    public int UserInsert(UserVo userVo)throws Exception;

    public UserVo CheckuserLogin(HashMap<String, String> map)throws Exception;

    public int GetCustomerSeq(String customerId)throws Exception;

    public int AddressInsert(AddressVo addressVo)throws Exception;

    public int CustomerGrade(CustomerGradeVo customerGradeVo)throws Exception;

    public int GetUserSeq(String userId)throws Exception;

    public int UserRoleInsert(HashMap<String, Object> map)throws Exception;
}
