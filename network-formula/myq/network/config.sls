network-connections-folder:
  file.directory:
    - name: /rw/config/NM-system-connections
    - makedirs: True
    - user: root
    - group: root
    - mode: 755

{% for ssid, wifi in salt['pillar.get']('network:wifi', {}).items() %}
wifi-{{ssid}}:
  file.managed:
    - name: /rw/config/NM-system-connections/{{ ssid }}.nmconnection
    - source: salt://myq/network/files/wifi.j2
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

{% endfor %}
