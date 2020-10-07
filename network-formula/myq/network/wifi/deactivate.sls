{% set ssid = pillar['ssid'] %}

wifi-{{ ssid }}-deactivation:
  file.absent:
    - name: /rw/config/NM-system-connections/{{ ssid }}.nmconnection
