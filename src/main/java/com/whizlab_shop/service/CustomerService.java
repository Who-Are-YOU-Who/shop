package com.whizlab_shop.service;

import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CartVo;

import java.util.Map;

public interface CustomerService {
    public int AddCart( CartVo cartVo) throws Exception;

    public AddressVo SelectAddress(Map<String, Object> map)throws Exception;
}
