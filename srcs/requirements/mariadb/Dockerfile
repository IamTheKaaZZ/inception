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
    && apk add --no-cache mariadb

# RUN rc-service mariadb status #check service status

# RUN /etc/init.d/mariadb setup #setup db

COPY conf/entrypoint.sh /usr/local/bin/
RUN chmod -x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]

CMD [ "mysql" ]