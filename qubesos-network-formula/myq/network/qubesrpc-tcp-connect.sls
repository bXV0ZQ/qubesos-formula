qubesrpc-tcp-connect:
  file.managed:
    - name: /etc/qubes-rpc/policy/qubes.ConnectTCP
    - source: salt://myq/network/files/qubes-rpc-policy.tcp-connect.sh.j2
    - template: jinja
    - user: root
    - group: qubes
    - mode: 664
