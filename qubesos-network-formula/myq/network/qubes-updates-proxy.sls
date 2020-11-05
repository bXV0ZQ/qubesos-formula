{% set netvm = salt['cmd.shell']('qvm-ls --tags netvm --raw-list') %}
{% set whonixgw = salt['cmd.shell']('qvm-ls --tags whonixgw --raw-list') %}

{% if netvm | length %}
qubes-updates-proxy-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/qubes.UpdatesProxy
    - source: salt://myq/network/files/qubes-rpc-policy.updates-proxy.j2
    - template: jinja
    - context:
        netvm: {{ netvm }}
        whonixgw: {{ whonixgw }}
    - user: root
    - group: root
    - mode: 664
{% endif %}