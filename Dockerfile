FROM anapsix/alpine-java:8_server-jre_unlimited
RUN mkdir -p /usr/share/fonts/chinese
COPY STSong.ttf /usr/share/fonts/chinese/STSong.ttf
COPY STSong.ttf /usr/share/fonts/chinese/STSongStd-Light.ttf
# 安装基础工具
RUN apk add --no-cache \
    curl \
    wget \
    fontconfig \
    ttf-dejavu \
    # 创建字体目录并下载字体
    && cd /usr/share/fonts/chinese \
    # 下载华文宋体 (STSong)
    # 设置权限
    && chmod 644 * \
    # 更新字体缓存
    && fc-cache -fv

# 设置时区和语言环境
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

