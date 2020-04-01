package io.wharfoo.biztier.demo.tunnel;


import io.wharfoo.biztier.demo.tunnel.database.mapper.uc.UserAccountMapper;
import org.junit.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("io.wharfoo.biztier.demo")
@MapperScan("io.wharfoo.biztier.usercenter.tunnel.database")
public class UserTest {


    @Autowired
    private UserAccountMapper accountMapper;


    @Test
    public void testFindByID() {

        //Account account = accountMapper.selectByPrimaryKey(2);
        System.out.println("Write your test here");
    }

}
