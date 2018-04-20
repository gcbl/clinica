package com.pucmg.tcc.gcbl.proposta3.clinica.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;


@EnableWebMvc
@ComponentScan(basePackages = {"com.pucmg.tcc.gcbl.proposta3.clinica.controller"})
@Configuration
public class TilesConfiguration extends WebMvcConfigurerAdapter{
	
    @Configuration
    public class ConfigurationForTiles {
    
        @Bean
        public TilesConfigurer tilesConfigurer() {
            final TilesConfigurer configurer = new TilesConfigurer();
            configurer.setDefinitions(new String[] { "/WEB-INF/tiles.xml" });
            configurer.setCheckRefresh(true);
            return configurer;
        }
    
        @Bean
        public TilesViewResolver tilesViewResolver() {
            final TilesViewResolver resolver = new TilesViewResolver();
            resolver.setViewClass(TilesView.class);
            return resolver;
        }
    }
    
}