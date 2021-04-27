# P3C (for Juphoon)

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

## 安装Git Hook

<br>

## 运行测试
