# P3C (for Juphoon)

[![Java CI with Maven](https://github.com/Juphoon/p3c/actions/workflows/maven.yml/badge.svg)](https://github.com/Juphoon/p3c/actions/workflows/maven.yml)
[![Upload Release Asset](https://github.com/Juphoon/p3c/actions/workflows/release.yml/badge.svg)](https://github.com/Juphoon/p3c/actions/workflows/release.yml)


[![License](https://img.shields.io/badge/license-Apache%202-4EB1BA.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)

点击[这里](https://github.com/Juphoon/p3c/blob/master/README.md)查看源项目README。


## 说明
Juphoon的[《Java编程指南》](https://juphoon.yuque.com/staff-upaale/rlxihh/zgggbf)参考了[《阿里巴巴Java开发手册》](https://github.com/alibaba/p3c/blob/master/Java%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C%EF%BC%88%E5%B5%A9%E5%B1%B1%E7%89%88%EF%BC%89.pdf)。阿里巴巴构建了[p3c项目](https://github.com/alibaba/p3c)用于开发配套的静态检查工具和插件，来帮助Java社区更好的实践《阿里巴巴Java开发手册》中倡导的编码规约。

为了便于对在推行[《Java编程指南》](https://juphoon.yuque.com/staff-upaale/rlxihh/zgggbf)过程中的对规约的自动化检查条款进行调整，我们从[p3c项目](https://github.com/alibaba/p3c)fork出这个项目来，主要用于构建基于[PMD(一个开源静态检查工具)](https://github.com/pmd/pmd)开发的静态检查工具。


项目包含了三个JAVA子项目:
- [p3c-pmd](https://github.com/Juphoon/p3c/blob/master/p3c-pmd) - 基于[PMD(一个开源静态检查工具)](https://github.com/pmd/pmd)构建的静态检查工具
- [idea-plugin](https://github.com/Juphoon/p3c/blob/master/idea-plugin) - IntelliJ IDEA 插件
- [eclipse-plugin](https://github.com/Juphoon/p3c/blob/master/eclipse-plugin) - Eclipse 插件

<br>

## 构建 p3c-pmd 工具

**Requirement**
- JDK 1.7+
- Maven 3

<br>

**Build**

```
$ mvn package
```

> ⚠️ 
> 如果本地环境不支持Kotlin，build时会报错。需要先行下载kotlin libs并将他们加入项目的libs目录中。下载地址如下：
> - https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/1.3.72/kotlin-stdlib-1.3.72.jar
> - https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-stdlib-jdk8/1.3.72/kotlin-stdlib-jdk8-1.3.72.jar.


<br>

## 为本地项目安装静态检查工具

### STEP 1 - 下载installer到本地

点击release链接：

<img src="https://github.com/Juphoon/p3c/blob/master/screen_shots/01.jpeg" width=700/>

点开Asset，下载**juphoon-p3c-pmd-installer.zip**

<img src="https://github.com/Juphoon/p3c/blob/master/screen_shots/02.jpeg" width=700/>

### STEP 2 - 安装p3c-pmd

**juphoon-p3c-pmd-installer.zip**中包含5个文件：
- juphoon-p3c-pmd-1.0.0.jar - 不含依赖的，可以导入项目lib来使用（不推荐）;
- juphoon-p3c-pmd-1.0.0-jar-with-dependencies.jar - 可独立环境使用的p3c-pmd，我们要安装的;
- juphoon-p3c-pmd-1.0.0-javadoc.jar - p3c-pmd的 javadoc;
- install.sh - 安装脚本
- pre-commit - git pre-commit hook 脚本

解压后，直接执行install.sh

```console
$ ./install.sh
```

### STEP 3 - 安装git pre-commit hook
将**juphoon-p3c-pmd**安装到指定目录后，我们需要将**pre-commit**复制到需要检查的项目的**.git**目录下。假设要检查的项目根目录是**/Users/xiali/GitHub/naive_java**：

```console
$ cp pre-commit /Users/xiali/GitHub/naive_java/.git/hooks/.
```


<br>

## 范例
静态检查会在每次**git commit**时作为前置动作执行。我们尝试对以下代码进行静态检查：

```java
package hello;

/**
没有@author, 将被静态检查捕获。
*/

public class Hello {
    public static void main(String[] args) {
        // 不符合 lower camel case，将被捕获
        String GreetingMsg = "java";
        if(Greet != "") {
            System.out.println("Hello " + Greet);
        }

        String str = "start";
        // 100是魔法值，将被捕获
        for(int i=0; i<100; i++) {
            // 没有使用StringBuilder，将被捕获
            str = str + "hello";
        }
    }
}
```

当执行`git commit`时，违反规约的情况将会捕获，用户无法提交代码到本地分支：

```console
$ git commit                                                                                                                              ✔  653  16:34:11
[Juphoon-p3c-pmd][Info] 入库前检查启动...

/Users/xiali/GitHub/naive_java/src/java/hello/Hello.java:8:	【Hello】注释缺少@author信息
/Users/xiali/GitHub/naive_java/src/java/hello/Hello.java:10:	变量名【GreetingMsg】不符合lowerCamelCase命名风格
/Users/xiali/GitHub/naive_java/src/java/hello/Hello.java:16:	魔法值【100】
/Users/xiali/GitHub/naive_java/src/java/hello/Hello.java:17:	循环体内，字符串的联接方式，使用StringBuilder的append方法进行扩展。

[Juphoon-p3c-pmd] Fail - 未通过静态检查！请确保代码符合【强制】中的规约要求，详见菊风《Java编码指南》。
```

<br>
