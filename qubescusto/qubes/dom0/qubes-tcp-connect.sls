# Settings

qubes-tcp-connect:
  file.managed:
    - name: /etc/qubes-rpc/policy/qubes.ConnectTCP
    - source: salt://qubescusto/qubes/dom0/files/qubes-rpc-policy.tcp-connect.sh.j2
    - template: jinja
    - user: root
    - group: qubes
    - mode: 664
