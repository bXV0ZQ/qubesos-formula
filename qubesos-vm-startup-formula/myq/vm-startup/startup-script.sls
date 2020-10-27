vm-startup-rc-local-init:
  file.managed:
    - name: /rw/config/rc.local
    - source: salt://myq/vm-startup/files/rc.local.sh.j2
    - template: jinja
    - user: root
    - group: root
    - replace: {{ salt['pillar.get']('rc-local:clean', False)}}
    - mode: 755
