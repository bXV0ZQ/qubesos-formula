include:
  - qvm.sys-firewall
  - qubescusto.domains.dev.template
  - qubescusto.qubes.dom0.qubes-tcp-connect

dev-phone:
  qvm.vm:
    - name: dev-phone
    - present:
      - template: {{ salt['pillar.get']('dev:domain:template', 'tmpl-dev') }}
      - label: {{ salt['pillar.get']('dev:domain:label', 'blue') }}
    - require:
      - qvm: sys-firewall
      - sls: qubescusto.domains.dev.template

dev-phone-volume:
  cmd.run:
    - name: qvm-volume resize dev-phone:private {{ salt['pillar.get']('dev:phone:volume', '-1') }}
    - onlyif: test $(qvm-volume info dev-phone:private size 2>/dev/null) -lt {{ salt['pillar.get']('dev:phone:volume', '-1') }}
    - require:
      - qvm: dev-phone

dev-phone-qubes-rpc-attach:
  file.managed:
    - name: /etc/qubes-rpc/dev.phone.Attach
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc.dev-phone-attach.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        phonerefs: {{ salt['pillar.get']('dev:phone:phonerefs', []) }}
    - user: root
    - group: root
    - mode: 755

dev-phone-qubes-rpc-policy-attach:
  file.managed:
    - name: /etc/qubes-rpc/policy/dev.phone.Attach
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc-policy.dev-phone-attach.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        usbvm: sys-usb
    - user: root
    - group: qubes
    - mode: 664

dev-phone-qubes-rpc-policy-adb-connect:
  file.accumulated:
    - name: tcp_connections
    - filename: /etc/qubes-rpc/policy/qubes.ConnectTCP
    - text: 'dev-phone @default allow,target=sys-usb'
    - require_in:
      - file: qubes-tcp-connect

dev-phone-qubes-rpc-remote-adb-start:
  file.managed:
    - name: /etc/qubes-rpc/dev.phone.StartRemoteADB
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc.dev-phone-remote-adb-start.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        usbvm: sys-usb
    - user: root
    - group: root
    - mode: 755

dev-phone-qubes-rpc-policy-remote-adb-start:
  file.managed:
    - name: /etc/qubes-rpc/policy/dev.phone.StartRemoteADB
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc-policy.dev-phone-remote-adb.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
    - user: root
    - group: qubes
    - mode: 664

dev-phone-qubes-rpc-remote-adb-stop:
  file.managed:
    - name: /etc/qubes-rpc/dev.phone.StopRemoteADB
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc.dev-phone-remote-adb-stop.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        usbvm: sys-usb
    - user: root
    - group: root
    - mode: 755

dev-phone-qubes-rpc-policy-remote-adb-stop:
  file.managed:
    - name: /etc/qubes-rpc/policy/dev.phone.StopRemoteADB
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc-policy.dev-phone-remote-adb.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
    - user: root
    - group: qubes
    - mode: 664
