FROM netboxcommunity/netbox:v4.2

RUN apt-get update -qq \
  && apt-get install \
  --yes -qq --no-install-recommends \
  git \
  &&  rm -rf /var/lib/apt/lists/*

COPY ./plugin_requirements.txt /
RUN /usr/local/bin/uv pip install -r /plugin_requirements.txt

COPY configuration/load_plugin.py /etc/netbox/config/load_plugin.py

RUN SECRET_KEY="#Xqw-#bQp9nAX_v2(4XE2EXHGAd_AaVEWob5M)ZYMxjuR(jJ4F" /opt/netbox/venv/bin/python manage.py collectstatic --no-input \
  && rm -rf /etc/netbox/config/load_plugin.py
