template-dev:
  qvm.clone:
    - name: {{ salt['pillar.get']('dev:domain:template', 'tmpl-dev') }}
    - source: {{ salt['pillar.get']('dev:domain:source', 'fedora-30') }}
    - label: gray