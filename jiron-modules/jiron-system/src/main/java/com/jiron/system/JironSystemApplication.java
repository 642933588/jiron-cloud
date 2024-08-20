package com.jiron.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.jiron.common.security.annotation.EnableCustomConfig;
import com.jiron.common.security.annotation.EnableRyFeignClients;
import com.jiron.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 系统模块
 *
 * @author ruoyi
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class JironSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JironSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ) ");
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
