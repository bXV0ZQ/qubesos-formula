{% set qcontext = {} %}
{% include 'myq/qubes/load_context.jinja' with context %}

{% load_yaml as qconf %}
domain: {{ qcontext.domain }}
name: {{ qcontext.name }}
template: {{ qcontext.defaults.domain.template }}
label: {{ qcontext.defaults.domain.label }}
{% endload %}

{% if conf is defined %}
{% do qconf.update(conf) %}
{% endif %}

include:
  - myq.{{ qconf.domain }}.{{ qconf.template }}

{{ qconf.name }}:
  qvm.vm:
    - name: {{ qconf.name }}
    - present:
      - template: {{ qconf.template }}
      - label: {{ qconf.label }}
    - prefs:
      - template: {{ qconf.template }}
      - label: {{ qconf.label }}
    - require:
      - qvm: {{ qconf.template }}

{% if qconf.volume | default(-1) > 0 %}
{{ qconf.name }}-volume:
  cmd.run:
    - name: qvm-volume resize {{ qconf.name }}:private {{ qconf.volume }}
    - onlyif: test $(qvm-volume info {{ qconf.name }}:private size 2>/dev/null) -lt {{ qconf.volume }}
    - require:
      - qvm: {{ qconf.name }}
{% endif %}