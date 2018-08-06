package com.kangyonggan.ck.config;

import com.kangyonggan.freemarker.BlockDirective;
import com.kangyonggan.freemarker.ExtendsDirective;
import com.kangyonggan.freemarker.OverrideDirective;
import com.kangyonggan.freemarker.SuperDirective;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * @author kangyonggan
 * @since 8/6/18
 */
@Configuration
public class FreemarkerConfiguration {

    @Autowired
    freemarker.template.Configuration configuration;

    @PostConstruct
    public void setSharedVariable() {
        configuration.setSharedVariable("block", new BlockDirective());
        configuration.setSharedVariable("override", new OverrideDirective());
        configuration.setSharedVariable("extends", new ExtendsDirective());
        configuration.setSharedVariable("super", new SuperDirective());
    }

}
