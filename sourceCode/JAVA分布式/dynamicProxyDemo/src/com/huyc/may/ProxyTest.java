package com.huyc.may;

public class ProxyTest {
	public static void main(String[] args) {
		GirlProxy proxy = new GirlProxy();
		Person person = proxy.getProxy();
		
		person.say("I HAT YOU");
	}
}
