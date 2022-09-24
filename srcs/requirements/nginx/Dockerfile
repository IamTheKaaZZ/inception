# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcosters <bcosters@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/02 17:39:02 by bcosters          #+#    #+#              #
#    Updated: 2022/08/29 13:59:24 by bcosters         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.15
RUN apk update \
    && apk add nginx \
    && apk add openssl

COPY conf/entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]