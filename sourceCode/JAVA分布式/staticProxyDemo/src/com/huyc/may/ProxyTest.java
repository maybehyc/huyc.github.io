package com.huyc.may;

/** 
 * 静态代理，这个代理类也必须要实现和被代理类相同的Person接口 
 * @author huyc 
 * 
 */  
public class ProxyTest implements Person{  
      
    private Person persion;  
      
    public ProxyTest(Person persion){  
        this.persion = persion;  
    }  
  
    public static void main(String[] args) {  
        // TODO Auto-generated method stub  
        //s为被代理的对象，某些情况下 我们不希望修改已有的代码，我们采用代理来间接访问  
        Girl girl = new Girl();  
        //创建代理类对象  
        ProxyTest proxy = new ProxyTest(girl);  
        //调用代理类对象的方法  
        proxy.say("I sick you");    
    }  
  
    @Override  
    public void say(String content) {  
        // TODO Auto-generated method stub  
        System.out.println("ProxyTest say begin");  
        //在代理类的方法中 间接访问被代理对象的方法  
        persion.say(content);  
        System.out.println("ProxyTest say end");  
    }
}