# Use the official Grafana image as the base image
FROM grafana/grafana:11.5.0

# Set the environment variable for the plugin
ENV GF_INSTALL_PLUGINS=victoriametrics-logs-datasource

# Copy provisioning, dashboards, and plugin files into the container
COPY ./provisioning /etc/grafana/provisioning
COPY ./dashboards /var/lib/grafana/dashboards
COPY ./provisioning/plugins /var/lib/grafana/plugins

# Expose Grafana's default port
EXPOSE 3000

# Run Grafana
CMD ["/bin/bash", "-c", "/usr/sbin/grafana-server"]
