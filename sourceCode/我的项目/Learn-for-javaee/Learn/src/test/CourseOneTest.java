import static org.junit.Assert.*;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.codehaus.jackson.annotate.JsonMethod;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.apache.log4j.Logger;

import com.huyc.may.entity.CourseOne;
import com.huyc.may.service.CourseOneService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring/spring-mybatis.xml"}) 
public class CourseOneTest {
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
	@Resource
	private CourseOneService courseOne;
//	@Before
//	public void setUp() throws Exception {
//	}

	@Test
	public void insertCourseOnetest() {
		CourseOne one = new CourseOne();  
		one.setCourseOneId("2");
		one.setCourseOneName("iOS");
//		logger.info()
		int result = 0;
		result = courseOne.insert(one);
		if (0 == result) {
			logger.info("失败");
		} else {
			logger.info("成功");
		}
        
	}
	
	@Test
	public void queryAlltest() throws JsonGenerationException, JsonMappingException, IOException {
		List<CourseOne> list = courseOne.queryAll();
		
		ObjectMapper mapper = new ObjectMapper();
        
        mapper.setVisibility(JsonMethod.FIELD, Visibility.ANY);
//        mapper.configure(SerializationConfig.Feature.INDENT_OUTPUT, true);
                
        String json = mapper.writeValueAsString(list);
        logger.info(json); 
	}
	
//	@Test
//	public void test() {
//		fail("Not yet implemented");
//	}

}
