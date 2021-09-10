#!/bin/sh

## java env
#export JAVA_HOME=/data/jdk1.8.0_121
#export JRE_HOME=$JAVA_HOME/jre

## service name
#当前目录
NOW_PATH=$(cd `dirname $0`; pwd)
#jar包路径
JAR_DIR=`ls -ltr $NOW_PATH/*.jar| tail -1`
#jar包名字
JAR_NAME=${JAR_DIR##*/}
#日志名字
LOG_NAME=${JAR_NAME%%.*}


PID=$LOG_NAME\.pid


case "$1" in

    start)
        nohup java -Xmx500m -Xms250m  -jar $JAR_NAME --spring.profiles.active=dev > logs/$LOG_NAME.log 2>&1 &
        #echo $! > $NOW_PATH/$PID
        #echo "=== start $JAR_NAME"
	#tail -1000f logs/$LOG_NAME.log
        ;;

    stop)
        echo "=== stop $JAR_NAME"
	ps -ef|grep $JAR_NAME |grep -v grep |awk '{print $2}'|xargs kill -9 
        ;;

    restart)
        $0 stop
        sleep 2
        $0 start
        echo "=== restart $LOG_NAME"
        ;;

    *)
        echo "Usage:$0 {start|stop|restart}"
        ;;

esac
exit 0

