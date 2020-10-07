net-qubes-rpc-nm-wifi-config:
  file.managed:
    - name: /etc/qubes-rpc/network.wifi.Notify
    - source: salt://myq/network/dom0/files/qubes-rpc.nm-wifi-config.sh.j2
    - template: jinja
    - context:
        netvm: {{ pillar['roles']['netvm'] }}
        wifi: {{ salt['pillar.get']('network:wifi', {}) }}
    - user: root
    - group: root
    - mode: 755

net-qubes-rpc-nm-wifi-config-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/network.wifi.Notify
    - source: salt://myq/network/dom0/files/qubes-rpc-policy.netvm-only.sh.j2
    - template: jinja
    - context:
        netvm: {{ pillar['roles']['netvm'] }}
    - user: root
    - group: qubes
    - mode: 664
    - require:
      - file: net-qubes-rpc-nm-wifi-config