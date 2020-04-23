# Global

code-settings-telemetry:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - '"telemetry.enableTelemetry": false'
      - '"telemetry.enableCrashReporter": false'
    - require_in:
      - file: code-settings

# Material Icon Theme

code-ext-icons:
  cmd.run:
    - name: code --install-extension pkief.material-icon-theme --force
    - runas: user
    - onlyif: which code

code-settings-ext-icons:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text: '"workbench.iconTheme": "material-icon-theme"'
    - require:
      - cmd: code-ext-icons
    - require_in:
      - file: code-settings

# Asciidoctor

code-ext-asciidoctor:
  cmd.run:
    - name: code --install-extension joaompinto.asciidoctor-vscode --force
    - runas: user
    - onlyif: which code && which wkhtmltopdf

code-settings-ext-asciidoctor:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text: '"asciidoc.wkhtmltopdf_path": "/usr/bin/wkhtmltopdf"'
    - require:
      - cmd: code-ext-asciidoctor
    - require_in:
      - file: code-settings

# Encode/Decode

code-ext-encode:
  cmd.run:
    - name: code --install-extension mitchdenny.ecdc --force
    - runas: user
    - onlyif: which code

# Git

code-ext-gitlens:
  cmd.run:
    - name: code --install-extension eamodio.gitlens --force
    - runas: user
    - onlyif: which code

# Settings

code-settings:
  file.managed:
    - name: /home/user/.config/Code/User/settings.json
    - source: salt://qubescusto/configs/code/files/settings.json.jinja
    - template: jinja
    - user: user
    - group: user
    - mode: 644
