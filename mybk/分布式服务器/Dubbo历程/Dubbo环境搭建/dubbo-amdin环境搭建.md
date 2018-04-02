# dubbo-amdin环境搭建

## 安装

wget http://apache.etoak.com/tomcat/tomcat-6/v6.0.35/bin/apache-tomcat-6.0.35.tar.gz
tar zxvf apache-tomcat-6.0.35.tar.gz
cd apache-tomcat-6.0.35
rm -rf webapps/ROOT

git clone https://github.com/dubbo/dubbo-ops.git /var/tmp/dubbo-ops
pushd /var/tmp/dubbo-ops
mvn clean package
popd

unzip /var/tmp/dubbo-ops/dubbo-admin/target/dubbo-admin-2.0.0.war -d webapps/ROOT

## 配置

vi webapps/ROOT/WEB-INF/dubbo.properties
dubbo.properties
dubbo.registry.address=zookeeper://127.0.0.1:2181
dubbo.admin.root.password=root
dubbo.admin.guest.password=guest

## 启动

./bin/startup.sh

## 停止

./bin/shutdown.sh

## 访问

http://127.0.0.1:8080/

