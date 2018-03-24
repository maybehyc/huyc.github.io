
import static org.junit.Assert.*;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
        Connection con = (Connection) sqlSessionFactory.openSession().getConnection();  
        assertNotNull("数据库连接失败!!!", con);  
    }

}
