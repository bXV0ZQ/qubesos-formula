dev-phone-udev-rules:
  file.managed:
    - name: /rw/config/udev/51-dev-phone.rules
    - source: salt://qubescusto/domains/dev/phone/files/51-dev-phone.attach.udev-rules.sh.j2
    - template: jinja
    - context:  
        phonevm: dev-phone
        phonerefs: {{ salt['pillar.get']('dev:phone:phonerefs', []) }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: sys-usb-udev-folder