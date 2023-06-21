package com.whizlab_shop.dao;

import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CartVo;

import java.util.Map;

public interface CustomerDAO {
    public int AddCart( CartVo cartVo)throws Exception;

    public AddressVo SelectAddress(Map<String, Object> map)throws Exception;
}
