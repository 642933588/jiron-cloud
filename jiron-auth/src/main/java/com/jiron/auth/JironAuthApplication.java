package com.jiron.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.jiron.common.security.annotation.EnableRyFeignClients;

/**
 * 认证授权中心
 *
 * @author ruoyi
 */
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class JironAuthApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JironAuthApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  认证中心启动成功   ლ(´ڡ`ლ) ");
        System.out.println("                               _(\\_/) \n" +
                "                             ,((((^`\\\n" +
                "                             ((((  (6 \\ \n" +
                "                          ,((((( ,    \\\n" +
                "       ,,,_              ,(((((  /\"._  ,`,\n" +
                "      ((((\\\\ ,...       ,((((   /    `-.-'\n" +
                "      )))  ;'    `\"'\"'\"\"((((   (      \n" +
                "    (((  /            (((      \\\n" +
                "      )) |                      |\n" +
                "     ((  |        .       '     |\n" +
                "     ))  \\     _ '      `t   ,.')\n" +
                "     (   |   y;- -,-\"\"'\"-.\\   \\/  \n" +
                "    )   / ./  ) /         `\\  \\\n" +
                "        |./   ( (           / /'\n" +
                "        ||     \\\\          //'|\n" +
                "        ||      \\\\       _//'||\n" +
                "        ||       ))     |_/  ||\n" +
                "        \\_\\     |_/          ||\n" +
                "        `'\"                  \\_\\\n" +
                "                             `'\"");
    }
}
