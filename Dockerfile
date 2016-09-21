FROM fluent/fluentd:latest
USER root
RUN apk add --no-cache --update vim
USER fluent
RUN gem install fluent-plugin-secure-forward \
    fluent-plugin-elasticsearch fluent-plugin-burrow \
    fluent-plugin-grep fluent-plugin-parser
ENV FLUENTD_CONF="rentspree-api.conf"
ADD rentspree-api.conf /fluentd/etc
EXPOSE 24224
