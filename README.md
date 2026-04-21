# Datadog Agent for Render

Datadog helps you capture application traces and metrics that can help you improve the performance for your app.

You can set up a single Datadog agent to capture data for any number of services in your Render account.

This example deploys Datadog's [Docker agent](https://docs.datadoghq.com/agent/docker/) as a [private service](https://render.com/docs/private-services) on Render. Once deployed, you can start sending [APM/Distributed Tracing](https://docs.datadoghq.com/tracing/) and [DogStatsD](https://docs.datadoghq.com/developers/dogstatsd/?tab=hostagent) metrics to your private service URL.

The URL will look like `datadog-agent-lkyz` with APM available on TCP port `8126` and DogStatsD on UDP port `8125`.

> You will need to configure your Datadog API key by setting the `DD_API_KEY` environment variable to your private service.


## This forked example also allows you to deploy Database Monitoring
Specifically, this template shows you how to setup Datadog DBM for MongoDB, where MongoDB is running as a private service within Render.

To get started, follow the steps listed in [Setting Up Database Monitoring for Self-Hosted MongoDB](https://docs.datadoghq.com/database_monitoring/setup_mongodb/selfhosted/?tab=standalone)

Next edit the `hosts` within `mongo-conf.yaml` to match the hostname of your MongoDB container.

Upon creating the Datadog Agent as a private service in Render, you'll also need to create a [secret file](https://render.com/docs/configure-environment-variables#secret-files) with your MongoDB password.
Call the file `secret.json` and it should look like this:
```
{
  "mongo_password": "<INSERT_MONGO_PASSWORD>"
}
```
