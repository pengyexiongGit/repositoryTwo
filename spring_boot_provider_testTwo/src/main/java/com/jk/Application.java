package com.jk;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@ImportResource("classpath:spring-dubbo-provider.xml")
public class Application  {

    public static void main(String[] args) {
         SpringApplication.run(Application.class, args);
    }
    
    @RequestMapping("product")
    void home() {
    	System.out.println("方法进来了");
        //return "redirect:test";
    }

}
