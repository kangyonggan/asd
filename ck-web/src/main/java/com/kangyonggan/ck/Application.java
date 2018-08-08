package com.kangyonggan.ck;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

/**
 * @author kangyonggan
 * @since 7/31/18
 */
@SpringBootApplication
@PropertySource("classpath:app.properties")
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }

}
