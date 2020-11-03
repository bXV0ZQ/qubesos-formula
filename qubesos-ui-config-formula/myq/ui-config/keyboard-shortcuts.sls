{% for s in salt['pillar.get']('keyboard:shortcuts', []) | list if s.action == 'unset' %}
ui-config-keyboard-shortcut-unset-{{ s.shortcut | uuid }}:
  cmd.run:
    - name: xfconf-query --channel 'xfce4-keyboard-shortcuts' --property '{{ s.shortcut }}' --reset'
    - runas: {{ pillar['context']['user'] }}
    - onlyif: xfconf-query --channel 'xfce4-keyboard-shortcuts' --property '{{ s.shortcut }}' 2>/dev/null
{% endfor %}

{% for s in salt['pillar.get']('keyboard:shortcuts', []) | list if s.action == 'set' %}
ui-config-keyboard-shortcut-set-{{ s.shortcut | uuid }}:
  cmd.run:
    - name: xfconf-query --channel "xfce4-keyboard-shortcuts" --property "{{ s.shortcut }}" --create --type string --set "{{ s.value }}"
    - runas: {{ pillar['context']['user'] }}
    - unless: "[[ \"$(xfconf-query --channel 'xfce4-keyboard-shortcuts' --property '{{ s.shortcut }}' 2>/dev/null)\" == \"{{ s.value }}\" ]]"
{% endfor %}
