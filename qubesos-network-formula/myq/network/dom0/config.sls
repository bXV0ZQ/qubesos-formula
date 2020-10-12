{% set desktop_files=[] %}

{% set home_folder=salt['user.info'](pillar['context']['user']).home %}

{% for pname, profile in pillar['network-profiles'].items() %}
{% set desktop_file=home_folder ~ "/.local/share/applications/network-profile-" ~ pname ~ ".desktop" %}
{% do desktop_files.append(desktop_file) %}

network-profile-qubes-rpc-{{ pname }}:
  file.managed:
    - name: /etc/qubes-rpc/network.profile.{{ pname | capitalize }}
    - source: salt://myq/network/files/qubes-rpc.network-profile-set.sh.j2
    - template: jinja
    - context:
        netvm: {{ pillar['roles']['netvm'] }}
        profile: {{ pname }}
        wifi: {{ profile.wifi }}
    - user: root
    - group: root
    - mode: 755

network-profile-qubes-rpc-{{ pname }}-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/network.profile.{{ pname }}
    - source: salt://myq/network/files/qubes-rpc-policy.network-profile.sh.j2
    - template: jinja
    - context:
        netvm: {{ pillar['roles']['netvm'] }}
    - user: root
    - group: qubes
    - mode: 664
    - require:
      - file: network-profile-qubes-rpc-{{ pname }}

network-profile-menu-{{ pname }}:
  file.managed:
    - name: {{ desktop_file }}
    - source: salt://myq/network/files/desktop-file.j2
    - template: jinja
    - context:
        name: "profile: {{ profile.name}}"
        comment: "Apply {{ profile.name}} network profile"
        icon: network-receive
        exec: /etc/qubes-rpc/network.profile.{{ pname | capitalize }}
    - onchanges_in:
      - cmd: network-profile-menu-install

{% endfor %}

network-profile-qubes-rpc-clean:
  file.managed:
    - name: /etc/qubes-rpc/network.profile.Clean
    - source: salt://myq/network/files/qubes-rpc.network-profile-clean.sh.j2
    - template: jinja
    - context:
        netvm: {{ pillar['roles']['netvm'] }}
    - user: root
    - group: root
    - mode: 755

network-profile-qubes-rpc-clean-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/network.profile.Clean
    - source: salt://myq/network/files/qubes-rpc-policy.network-profile.sh.j2
    - template: jinja
    - context:
        netvm: {{ pillar['roles']['netvm'] }}
    - user: root
    - group: qubes
    - mode: 664
    - require:
      - file: network-profile-qubes-rpc-clean

{% set desktop_file=home_folder ~ "/.local/share/applications/network-profile-clean.desktop" %}
{% do desktop_files.append(desktop_file) %}

network-profile-menu-clean:
  file.managed:
    - name: {{ desktop_file }}
    - source: salt://myq/network/files/desktop-file.j2
    - template: jinja
    - context:
        name: "Clean profiles"
        comment: "Clean network profile"
        icon: network-error
        exec: /etc/qubes-rpc/network.profile.Clean
    - onchanges_in:
      - cmd: network-profile-menu-install

{% set directory_file=home_folder ~ "/.local/share/desktop-directories/network-profile.directory" %}
network-profile-menu-directory:
  file.managed:
    - name: {{ directory_file }}
    - source: salt://myq/network/files/directory-file.j2
    - template: jinja
    - context:
        name: "Configure Network Profiles"
        icon: network-wired-symbolic
    - onchanges_in:
      - cmd: network-profile-menu-install

network-profile-menu-install:
  cmd.run:
    - name: xdg-desktop-menu install {{ directory_file }} {{ desktop_files | join(' ') }}
