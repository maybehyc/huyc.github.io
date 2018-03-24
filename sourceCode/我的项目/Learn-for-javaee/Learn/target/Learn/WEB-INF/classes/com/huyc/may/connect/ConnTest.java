package com.huyc.may.connect;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("classpath:spring/aplicationContext-dao.xml")
public class ConnTest {

	@Before
	public void setUp() throws Exception {
	}

	@Autowired  
    private SqlSessionFactory sqlSessionFactory;  
  
    @Test  
    public void testConn() {  
        Connection con = sqlSessionFactory.openSession().getConnection();  
        assertNotNull("数据库连接失败!!!", con);  
    }

}
