FROM python:3.8-alpine

ENV arris_stats_debug=False \
  destination=influxdb \
  sleep_interval=300 \
  modem_url=https://192.168.100.1/cmconnectionstatus.html \
  modem_verify_ssl=False \
  modem_auth_required=False \
  modem_username=admin \
  modem_password=None \
  modem_model=sb8200 \
  exit_on_auth_error=True \
  exit_on_html_error=True \
  clear_auth_token_on_html_error=True \
  sleep_before_exit=True \
  influx_host=localhost \
  influx_database=cable_modem_stats \
  influx_port=8086 \
  influx_username=None \
  influx_password=None \
  influx_use_ssl=False \
  influx_verify_ssl=True


ADD src/ /src
WORKDIR /src

RUN pip install -r requirements.txt

CMD ["python3","arris_stats.py","--config","config.ini"]
