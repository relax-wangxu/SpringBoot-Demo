# 简单 Spring Boot 示例

一个只包含一个 REST 接口的 Spring Boot 项目，参考了示例项目的“可直接打包、部署和访问”的基础结构。

## 环境

- JDK 21
- Apache Maven 3.9.16
- Spring Boot 3.5.16

项目根目录的 `.mvn/maven.config` 已自动指定 `.mvn/settings.xml`。该文件将所有仓库（包括父 POM 与插件）镜像到阿里云；`pom.xml` 也显式声明了阿里云仓库，以便 IDE 导入 Maven 项目时同样使用它。

## 运行

```bash
mvn clean test
mvn spring-boot:run
```

若 IDE 或终端的全局 Maven 配置覆盖了项目配置，请显式执行以下命令（这是强制使用阿里云镜像的方式）：

```bash
mvn --settings .mvn/settings.xml clean test
```

启动后直接访问：

```bash
curl http://localhost:8888/
```

根路径响应：

```json
{"message":"Hello SpringBoot Version:v1"}
```

健康检查：

```bash
curl http://localhost:8888/health
```

响应：

```json
{"status":"ok"}
```

## 打包和启动

```bash
mvn clean package
java -jar target/simple-spring-boot-demo-0.0.1-SNAPSHOT.jar
```

如需确认 Maven 实际版本，请执行：

```bash
mvn -version
```

输出中的 Maven 版本应为 `3.9.16`，Java 版本应为 `21`。
