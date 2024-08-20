#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../sql/ry_20231130.sql ./mysql/db
cp ../sql/ry_config_20231204.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../jiron-ui/dist/** ./nginx/html/dist


# copy jar
echo "begin copy jiron-gateway "
cp ../jiron-gateway/target/jiron-gateway.jar ./jiron/gateway/jar

echo "begin copy jiron-auth "
cp ../jiron-auth/target/jiron-auth.jar ./jiron/auth/jar

echo "begin copy jiron-visual "
cp ../jiron-visual/jiron-monitor/target/jiron-visual-monitor.jar  ./jiron/visual/monitor/jar

echo "begin copy jiron-modules-system "
cp ../jiron-modules/jiron-system/target/jiron-modules-system.jar ./jiron/modules/system/jar

echo "begin copy jiron-modules-file "
cp ../jiron-modules/jiron-file/target/jiron-modules-file.jar ./jiron/modules/file/jar

echo "begin copy jiron-modules-job "
cp ../jiron-modules/jiron-job/target/jiron-modules-job.jar ./jiron/modules/job/jar

echo "begin copy jiron-modules-gen "
cp ../jiron-modules/jiron-gen/target/jiron-modules-gen.jar ./jiron/modules/gen/jar

