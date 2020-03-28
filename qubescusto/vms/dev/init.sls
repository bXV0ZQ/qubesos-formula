include:
    - qvm.sys-firewall
    - qubescusto.templates.dev

dev:
    qvm.vm:
        - name: dev
        - present:
            - template: tmpl-dev
            - label: blue
        - require:
            - qvm: sys-firewall
            - sls: qubescusto.templates.dev