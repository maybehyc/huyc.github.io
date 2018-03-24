package com.huyc.may.controller;

import java.io.IOException;

import javax.annotation.Resource;  
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.annotate.JsonMethod;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huyc.may.entity.User;  
import com.huyc.may.service.UserSercice;
  
@Controller  
@RequestMapping("/user")  
public class UserController {  
    @Resource  
    private UserSercice userService;  
      
    @RequestMapping("/showLogin")  
    @ResponseBody
    public String login(HttpServletRequest request,Model model) throws JsonGenerationException, JsonMappingException, IOException{  
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        User user = this.userService.getUserById(userId);  
        User user = this.userService.getUserByNameAndPassword(username, password);
        if (null != user) { 
        	ObjectMapper mapper = new ObjectMapper();
            
            mapper.setVisibility(JsonMethod.FIELD, Visibility.ANY);
//            mapper.configure(SerializationConfig.Feature.INDENT_OUTPUT, true);
                    
            String json = mapper.writeValueAsString(user);
            return json;
        }
        return "登录失败";
    }  
}  
