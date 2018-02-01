package com.efrobot.robotstore.baseapi.manager;
import java.util.List;

import com.efrobot.robotstore.baseapi.manager.pojo.Channel;

public interface ChannelMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Channel record);

    int insertSelective(Channel record);

    Channel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Channel record);

    int updateByPrimaryKey(Channel record);
    
    List<Channel> getChannel(Channel channel);
}