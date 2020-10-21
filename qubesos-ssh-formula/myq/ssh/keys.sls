{% for kname, key in salt['pillar.get']('ssh:keys',{}).items() %}
ssh-private-key-{{ kname }}:
  file.managed:
    - name: /home/user/.ssh/{{ key.name }}
    - contents_pillar: ssh:keys:{{ kname }}:priv_key
    - user: user
    - group: user
    - mode: 600
    - attrs: a
    - makedirs: True

ssh-public-key-{{ kname}}:
  file.managed:
    - name: /home/user/.ssh/{{ key.name }}.pub
    - contents_pillar: ssh:keys:{{ kname }}:pub_key
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
{% endfor %}
