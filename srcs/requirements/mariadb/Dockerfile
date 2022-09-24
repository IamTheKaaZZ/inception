# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcosters <bcosters@student.42lisboa.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/02 17:39:02 by bcosters          #+#    #+#              #
#    Updated: 2022/08/29 14:35:19 by bcosters         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.15
RUN apk update \
    && apk add --no-cache mariadb \
    mariadb-client

RUN apk add util-linux openrc

VOLUME /sys/fs/cgroup

RUN rc-update add mariadb default \
  && mkdir /run/openrc \
  && touch /run/openrc/softlevel    # suppress OpenRc warning

COPY conf/entrypoint.sh /usr/local/bin/

RUN chmod -x /usr/local/bin/entrypoint.sh \
  && ln -s /usr/local/bin/entrypoint.sh / # backwards compat

ENTRYPOINT [ "entrypoint.sh" ]

CMD [ "mysql" ]