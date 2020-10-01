{% for qube in qubes_to_clean %}
clean-{{ qube }}:
  qvm.absent:
    - name: {{ qube }}
{% endfor %}