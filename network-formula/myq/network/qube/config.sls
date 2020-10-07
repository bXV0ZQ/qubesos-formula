{% set hookfile = "/rw/config/00-wifi-notify.sh" %}

net-nm-hook:
  file.managed:
    - name: {{ hookfile }}
    - source: salt://myq/network/qube/files/network.wifi.notify.sh.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 755

net-rc-local:
  file.managed:
    - name: /rw/config/rc.local
    - source: salt://myq/network/qube/files/rc.local.sh.j2
    - template: jinja
    - context:
        hookfile: {{ hookfile }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: net-nm-hook