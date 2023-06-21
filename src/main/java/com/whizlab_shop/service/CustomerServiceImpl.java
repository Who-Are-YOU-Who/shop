package com.whizlab_shop.service;

import com.whizlab_shop.dao.CustomerDAO;
import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerDAO dao;

    @Override
    public int AddCart( CartVo cartVo) throws Exception {
        return dao.AddCart(cartVo);
    }

    @Override
    public AddressVo SelectAddress(Map<String, Object> map) throws Exception {
        return dao.SelectAddress(map);
    }
}
