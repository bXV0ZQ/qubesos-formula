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
