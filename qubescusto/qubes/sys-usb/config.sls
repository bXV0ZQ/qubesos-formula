sys-usb-rc-local:
  file.managed:
    - name: /rw/config/rc.local
    - source: salt://qubescusto/qubes/sys-usb/files/rc.local.sh
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: sys-usb-udev-folder

sys-usb-udev-folder:
  file.directory:
    - name: /rw/config/udev
    - makedirs: True
    - user: root
    - group: root
    - mode: 755