include:
  - qvm.sys-firewall
  - qubescusto.domains.dev.template

dev:
  qvm.vm:
    - name: dev
    - present:
      - template: {{ salt['pillar.get']('dev:domain:template', 'tmpl-dev') }}
      - label: {{ salt['pillar.get']('dev:domain:label', 'blue') }}
    - require:
      - qvm: sys-firewall
      - sls: qubescusto.domains.dev.template