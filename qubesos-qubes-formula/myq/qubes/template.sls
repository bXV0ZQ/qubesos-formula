{% from 'myq/qubes/macros.jinja' import template_id with context %}

{% set qcontext = {} %}
{% include 'myq/qubes/load_context.jinja' with context %}

{% load_yaml as qconf %}
domain: {{ qcontext.domain }}
name: {{ qcontext.name }}
label: {{ qcontext.defaults.template.label }}
{% endload %}

{% if conf is defined %}
{% do qconf.update(conf) %}
{% endif %}

{{ template_id(qconf.name) }}:
  qvm.vm:
    - name: {{ qconf.name }}
    - clone:
      - source: {{ qconf.source }}
      - label: {{ qconf.label }}
    - prefs:
      - label: {{ qconf.label }}