remote-adb-adbctl:
  file.managed:
    - name: /usr/local/bin/adbctl
    - source: salt://myq/android-dev/files/adbctl.sh.j2
    - user: root
    - group: root
    - mode: 755
