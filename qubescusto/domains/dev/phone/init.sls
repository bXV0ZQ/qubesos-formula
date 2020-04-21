include:
  - qubescusto.domains.dev

dev-phone:
  qvm.vm:
    - name: dev-phone
    - present:
      - template: tmpl-dev
      - label: blue
    - require:
      - qvm: sys-firewall
      - sls: qubescusto.domains.dev.template