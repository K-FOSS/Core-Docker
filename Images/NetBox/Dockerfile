FROM netboxcommunity/netbox:v4.2

RUN apt-get update -qq \
  && apt-get install \
  --yes -qq --no-install-recommends \
  git \
  &&  rm -rf /var/lib/apt/lists/*

COPY ./plugin_requirements.txt /
RUN /usr/local/bin/uv pip install -r /plugin_requirements.txt
