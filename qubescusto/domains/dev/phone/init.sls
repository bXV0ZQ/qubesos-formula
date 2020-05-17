include:
  - qvm.sys-firewall
  - qubescusto.domains.dev.template

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

dev-phone-qubes-rpc:
  file.managed:
    - name: /etc/qubes-rpc/dev.phone.Attach
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc-dev.phone.Attach.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        phonerefs: {{ salt['pillar.get']('dev:phone:phonerefs', []) }}
    - user: root
    - group: root
    - mode: 755

dev-phone-qubes-rpc-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/dev.phone.Attach
    - source: salt://qubescusto/domains/dev/phone/files/qubes-rpc-policy-dev.phone.Attach.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        usbvm: sys-usb
    - user: root
    - group: qubes
    - mode: 644
