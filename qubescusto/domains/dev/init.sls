include:
    - qvm.sys-firewall
    - qubescusto.domains.dev._tmpl

dev:
    qvm.vm:
        - name: dev
        - present:
            - template: tmpl-dev
            - label: blue
        - require:
            - qvm: sys-firewall
            - sls: qubescusto.domains.dev._tmpl