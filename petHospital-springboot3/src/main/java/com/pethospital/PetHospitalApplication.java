package com.pethospital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class PetHospitalApplication {

    public static void main(String[] args) {
        SpringApplication.run(PetHospitalApplication.class, args);
        System.out.println("\n" +
                "  ┌────────────────────────┐\n" +
                "  │  宠物医院管理系统 启动完成! │\n" +
                "  └────────────────────────┘\n"
        );
    }

}
