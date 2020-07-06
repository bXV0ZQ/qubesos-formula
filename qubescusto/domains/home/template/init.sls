template-home:
  qvm.clone:
    - name: {{ salt['pillar.get']('home:domain:template', 'tmpl-home') }}
    - source: {{ salt['pillar.get']('home:domain:source', '') }}
    - label: gray