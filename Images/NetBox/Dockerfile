# syntax=docker/dockerfile:1.7
FROM docker.io/netboxcommunity/netbox:v4.6.8

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
  apt-get update -qq \
  && apt-get install \
  --yes -qq --no-install-recommends \
  git

COPY ./plugin_requirements.txt /
RUN --mount=type=cache,target=/root/.cache/uv \
  /usr/local/bin/uv pip install -r /plugin_requirements.txt

COPY configuration/load_plugin.py /etc/netbox/config/load_plugin.py

RUN SECRET_KEY="#Xqw-#bQp9nAX_v2(4XE2EXHGAd_AaVEWob5M)ZYMxjuR(jJ4F" /opt/netbox/venv/bin/python manage.py collectstatic --no-input \
  && rm -rf /etc/netbox/config/load_plugin.py \
  && mkdir -p /opt/netbox/netbox/static/netbox_topology_views/img
