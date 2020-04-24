# Global

vscode-settings-telemetry:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - '"telemetry.enableTelemetry": false'
      - '"telemetry.enableCrashReporter": false'
    - require_in:
      - file: vscode-settings

# Material Icon Theme

vscode-ext-icons:
  cmd.run:
    - name: code --install-extension pkief.material-icon-theme --force
    - runas: user
    - onlyif: which code

vscode-settings-ext-icons:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text: '"workbench.iconTheme": "material-icon-theme"'
    - require:
      - cmd: vscode-ext-icons
    - require_in:
      - file: vscode-settings

# Asciidoctor

vscode-ext-asciidoctor:
  cmd.run:
    - name: code --install-extension joaompinto.asciidoctor-vscode --force
    - runas: user
    - onlyif: which code && which wkhtmltopdf

vscode-settings-ext-asciidoctor:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text: '"asciidoc.wkhtmltopdf_path": "/usr/bin/wkhtmltopdf"'
    - require:
      - cmd: vscode-ext-asciidoctor
    - require_in:
      - file: vscode-settings

# Encode/Decode

vscode-ext-encode:
  cmd.run:
    - name: code --install-extension mitchdenny.ecdc --force
    - runas: user
    - onlyif: which code

# Git

vscode-ext-gitlens:
  cmd.run:
    - name: code --install-extension eamodio.gitlens --force
    - runas: user
    - onlyif: which code

# Settings

vscode-settings:
  file.managed:
    - name: /home/user/.config/Code/User/settings.json
    - source: salt://qubescusto/configs/vscode/files/settings.json.jinja
    - template: jinja
    - user: user
    - group: user
    - mode: 644
