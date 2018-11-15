package impl;


import com.upc.dao.RoleRepository;
import com.upc.dao.UserRepository;
import com.upc.model.Role;
import com.upc.model.User;
import com.upc.service.UserService;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.LinkedList;
import java.util.List;

/** 
* UserServiceImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>十一月 8, 2018</pre> 
* @version 1.0 
*/
@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:springmvc-servlet.xml"})
@EnableWebMvc
public class UserServiceImplTest { 

    @Autowired
    private UserService userService;

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: queryById(Integer id) 
* 
*/ 
@Test
public void testQueryById() throws Exception { 
//TODO: Test goes here...
    User user = userService.queryById(1);
    System.out.println(user);
    User user1 = userService.queryById(1);
    System.out.println(user1);

} 

/** 
* 
* Method: queryAllByLimit(int offset, int limit) 
* 
*/
@Autowired
private RoleRepository roleDao;
@Test
public void testQueryAllByLimit() throws Exception { 
//TODO: Test goes here...
    Role role = roleDao.findOneById(1);
    System.out.println(role);
} 

/** 
* 
* Method: insert(User user) 
* 
*/ 
@Test
public void testInsert() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: update(User user) 
* 
*/
@Autowired
private BCryptPasswordEncoder bCryptPasswordEncoder;
@Test
public void testUpdate() throws Exception { 
//TODO: Test goes here...
    User user = userService.queryById(1);
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    userService.save(user);
} 

/** 
* 
* Method: deleteById(Integer id) 
* 
*/
    @Autowired
    private UserRepository userRepository;
@Test
public void testDeleteById() throws Exception { 
//TODO: Test goes here...
    List<User> all = userRepository.findAll();
    System.out.println(all);
    User byUserName = userService.findByUserName("123456");
    System.out.println(byUserName);
//    User user = new User();
//    user.setUserName("123456");
//    user.setPassword(bCryptPasswordEncoder.encode("123456"));
//    user.setEmail("123456@qq.com");
//    user.setEnable(true);
//    userRepository.save(user);
} 

/** 
* 
* Method: queryUserAndRoleById(Integer id) 
* 
*/ 
@Test
public void testQueryUserAndRoleById() throws Exception { 
//TODO: Test goes here...
    User user = userService.queryById(1);
    System.out.println(user);
} 

/** 
* 
* Method: insertUsers(List<User> users) 
* 
*/ 
@Test
public void testInsertUsers() throws Exception { 
//TODO: Test goes here...
    List<User> users = new LinkedList<>();
    for (int i= 0 ;i<20;i++){
        User user = new User();
        user.setUserName("123456"+i);
        user.setPassword(user.getUsername());
        List<Role> roles  = new LinkedList<>();
        Role role = new Role();
        role.setId(2);
        roles.add(role);
        user.setRoles(roles);
        users.add(user);
    }
    userService.saveAll(users);

} 


} 
