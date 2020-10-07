{% set ssid = pillar['ssid'] %}
{% set wifi = pillar['network']['wifi'][ssid] %}

wifi-{{ ssid }}-activation:
  file.managed:
    - name: /rw/config/NM-system-connections/{{ ssid }}.nmconnection
    - source: salt://myq/network/wifi/files/nmconnection.j2
    - template: jinja
    - context:
        ssid: {{ ssid }}
        uuid: {{ ssid | uuid }}
        ifname: {{ wifi.ifname }}
        secret: {{ wifi.secret }}
    - user: root
    - group: root
    - mode: 600
    - require:
      - file: network-connections-folder
