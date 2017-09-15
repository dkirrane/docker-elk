# https://github.com/elastic/kibana-docker
FROM docker.elastic.co/kibana/kibana:5.5.1

# Add your kibana plugins setup here
# Example: RUN kibana-plugin install <name|url>

# https://sematext.com/blog/2017/05/22/x-pack-alternatives/

# Alerting & Reporting
# http://elastalert.readthedocs.io/en/latest/#

# Alerting
# https://github.com/sirensolutions/sentinl
RUN /opt/kibana/bin/kibana-plugin install https://github.com/sirensolutions/sentinl/releases/download/tag-5.5/sentinl-v5.5.1.zip
