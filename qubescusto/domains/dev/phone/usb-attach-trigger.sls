dev-phone-udev-rules-usb-attach-trigger:
  file.managed:
    - name: /rw/config/udev/52-phone-attach.rules
    - source: salt://qubescusto/domains/dev/phone/files/udev-rules.sys-usb.attach.sh.j2
    - template: jinja
    - context:  
        phonevm: dev-phone
        phonerefs: {{ salt['pillar.get']('dev:phone:phonerefs', []) }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: sys-usb-udev-folder