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