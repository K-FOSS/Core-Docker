FROM netboxcommunity/netbox:v4.2

RUN apt-get update -qq \
  && apt-get install \
  --yes -qq --no-install-recommends \
  git \
  &&  rm -rf /var/lib/apt/lists/*

COPY ./plugin_requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt
