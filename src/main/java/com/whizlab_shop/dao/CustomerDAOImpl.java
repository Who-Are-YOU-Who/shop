package com.whizlab_shop.dao;

import com.whizlab_shop.vo.AddressVo;
import com.whizlab_shop.vo.CartVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class CustomerDAOImpl implements CustomerDAO{
    @Autowired
    private SqlSession session;

    private static final String namespace = "com.whiz_shop.CustomerMapper"; //수정필요

    @Override
    public int AddCart( CartVo cartVo) throws Exception {
        return session.insert(namespace +".addCart", cartVo);
    }

    @Override
    public AddressVo SelectAddress(Map<String, Object> map) throws Exception {
        return session.selectOne(namespace+".selectAddress",map);
    }
}
