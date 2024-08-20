package com.jiron.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class JironGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JironGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  网关启动成功   ლ(´ڡ`ლ) ");
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
