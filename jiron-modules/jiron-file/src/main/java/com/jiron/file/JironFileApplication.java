package com.jiron.file;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.jiron.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 文件服务
 *
 * @author ruoyi
 */
@EnableCustomSwagger2
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class JironFileApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JironFileApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  文件服务模块启动成功   ლ(´ڡ`ლ) ");
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
