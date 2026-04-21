FROM datadog/agent:7

RUN usermod -a -G 1000 dd-agent
# disable autoconfigured checks; DD container checks
# do not work as-is on Render since there's no access
# to Kubelet/kube-state-metrics.
ENV DD_AUTOCONFIG_FROM_ENVIRONMENT=false

ENV NON_LOCAL_TRAFFIC=true
ENV DD_LOGS_STDOUT=yes

# Secrets Management
ENV DD_SECRET_BACKEND_TYPE="file.json"
ENV DD_SECRET_BACKEND_CONFIG='{"file_path":"/etc/secrets/secret.json"}'

ENV DD_APM_ENABLED=true
ENV DD_APM_NON_LOCAL_TRAFFIC=true

ENV DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
ENV DD_PROCESS_AGENT_ENABLED=true

# Automatically set by Render
ARG RENDER_SERVICE_NAME=datadog

ENV DD_BIND_HOST=$RENDER_SERVICE_NAME
ENV DD_HOSTNAME=$RENDER_SERVICE_NAME

# Add in Mongo Check as label
COPY mongo_conf.yaml /etc/datadog-agent/conf.d/mongo.d/conf.yaml