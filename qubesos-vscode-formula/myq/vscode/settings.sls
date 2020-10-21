vscode-settings:
  file.managed:
    - name: /home/user/.config/Code/User/settings.json
    - source: salt://myq/vscode/files/settings.json.j2
    - template: jinja
    - user: user
    - group: user
    - mode: 644
