package com.jiron.modules.monitor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import de.codecentric.boot.admin.server.config.EnableAdminServer;

/**
 * 监控中心
 *
 * @author ruoyi
 */
@EnableAdminServer
@SpringBootApplication
public class JironMonitorApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(JironMonitorApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  监控模块启动成功   ლ(´ڡ`ლ)");
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
