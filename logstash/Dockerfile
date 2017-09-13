# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:5.5.1

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

# Offline install log-courier plugin https://github.com/driskell/log-courier/blob/1.x/docs/LogstashIntegration.md#manual-installation
# https://rubygems.org/gems/log-courier
# https://rubygems.org/gems/logstash-input-courier
ADD plugins/ /plugins/
# RUN logstash-plugin install --no-verify --local /plugins/log-courier-1.9.0.gem
# RUN logstash-plugin install --no-verify --local /plugins/logstash-input-courier-1.9.1.gem
