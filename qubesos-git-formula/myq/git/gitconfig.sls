{% for name, value in salt['pillar.get']('git:config',{}).items() %}
git-config-{{ name }}:
  git.config_set:
    - name: {{ name }}
    - value: {{ value }}
    - user: user
    - global: True
{% endfor %}