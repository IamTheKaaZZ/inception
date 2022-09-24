# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcosters <bcosters@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/02 17:39:02 by bcosters          #+#    #+#              #
#    Updated: 2022/08/29 14:36:19 by bcosters         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.15

RUN apk update \
    && apk add --no-cache \
		ca-certificates \
		curl \
		tar \
		xz \
        openssl

# php-fpm
RUN apk add php7 \
        php7-fpm \
        php7-opcache

# php-modules
RUN apk add php7-gd \
        php7-mysqli \
        php7-zlib \
        php7-curl

# clean cache files
RUN rm -rf /var/cache/apk/*

ENV WP_DIR /usr/share/webapps/

# install Wordpress

RUN mkdir -p ${WP_DIR} \
        && wget http://wordpress.org/latest.tar.gz -P ${WP_DIR} \
        && tar -xzvf ${WP_DIR}latest.tar.gz \
        && rm ${WP_DIR}latest.tar.gz \
        && ln -s /usr/share/webapps/wordpress/ /var/www/wordpress

# copy the config-file into it
COPY wp-config.php $WP_DIR

# Override stop signal to stop process gracefully
STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD [ "php-fpm" ]
