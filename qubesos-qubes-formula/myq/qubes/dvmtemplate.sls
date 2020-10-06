{% from 'myq/qubes/macros.j2' import appvm_id with context %}
{% from 'myq/qubes/macros.j2' import template_id with context %}

{% set qcontext = {} %}
{% include 'myq/qubes/load_context.j2' with context %}

{% load_yaml as qconf %}
domain: {{ qcontext.domain }}
name: {{ qcontext.name }}
template: {{ qcontext.defaults.domain.template }}
label: {{ qcontext.defaults.domain.label }}
network: True
internal: False
{% endload %}

{% if conf is defined %}
{% do qconf.update(conf) %}
{% endif %}

include:
  - myq.{{ qconf.domain }}.{{ qconf.template }}

{{ template_id(qconf.name) }}:
  qvm.vm:
    - name: {{ qconf.name }}
    - present:
      - template: {{ qconf.template }}
      - label: {{ qconf.label }}
    - prefs:
      - template: {{ qconf.template }}
      - label: {{ qconf.label }}
      - dispvm-allowed: True
{% if not qconf.network %}
      - netvm: ''
{% elif qconf.netvm is defined %}
      - netvm: {{ qconf.netvm }}
{% endif %}
    - features:
      - enable:
        - appmenus-dispvm
{% if qconf.internal %}
        - internal
{% endif %}
      - disable:
{% if not qconf.internal %}
        - internal
{% endif %}
    - require:
      - qvm: {{ template_id(qconf.template) }}
