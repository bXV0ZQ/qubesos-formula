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
autostart: False
disposable: False
internal: False
{% endload %}

{% if conf is defined %}
{% do qconf.update(conf) %}
{% endif %}

include:
  - myq.{{ qconf.domain }}.{{ qconf.template }}

{{ appvm_id(qconf.name) }}:
  qvm.vm:
    - name: {{ qconf.name }}
    - present:
      - template: {{ qconf.template }}
      - label: {{ qconf.label }}
{% if qconf.disposable %}
      - class: DispVM
{% endif%}
    - prefs:
      - template: {{ qconf.template }}
      - label: {{ qconf.label }}
{% if not qconf.network %}
      - netvm: ''
{% elif qconf.netvm is defined %}
      - netvm: {{ qconf.netvm }}
{% endif %}
{% if qconf.autostart %}
      - autostart: True
{% endif%}
{% if qconf.memory is defined %}
      - memory: {{ qconf.memory }}
{% endif%}
    - features:
      - enable:
{% if qconf.internal %}
        - internal
{% endif %}
      - disable:
{% if not qconf.internal %}
        - internal
{% endif %}
    - require:
      - qvm: {{ template_id(qconf.template) }}

{% if qconf.volume | default(-1) > 0 %}
{{ appvm_id(qconf.name) }}-volume:
  cmd.run:
    - name: qvm-volume resize {{ qconf.name }}:private {{ qconf.volume }}
    - onlyif: test $(qvm-volume info {{ qconf.name }}:private size 2>/dev/null) -lt {{ qconf.volume }}
    - require:
      - qvm: {{ appvm_id(qconf.name) }}
{% endif %}