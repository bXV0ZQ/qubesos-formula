include:
  - qvm.sys-firewall
  - qubescusto.domains.home.template

acsa:
  qvm.vm:
    - name: acsa
    - present:
      - template: {{ salt['pillar.get']('home:domain:template', 'tmpl-home') }}
      - label: {{ salt['pillar.get']('home:domain:label', 'purple') }}
    - require:
      - qvm: sys-firewall
      - sls: qubescusto.domains.home.template