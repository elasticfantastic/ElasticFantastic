ARG ELK_VERSION

# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:${ELK_VERSION}
USER root
RUN mkdir -p /logs/sincedb

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
