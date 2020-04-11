# Global

code_settings_telemetry:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - '"telemetry.enableTelemetry": false'
      - '"telemetry.enableCrashReporter": false'
    - require_in:
      - file: code_settings

# Material Icon Theme

code_ext_icons:
  cmd.run:
    - name: code --install-extension pkief.material-icon-theme --force
    - runas: user
    - onlyif: which code

code_settings_ext_icons:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text: '"workbench.iconTheme": "material-icon-theme"'
    - require:
      - cmd: code_ext_icons
    - require_in:
      - file: code_settings

# Asciidoctor

code_ext_asciidoctor:
  cmd.run:
    - name: code --install-extension joaompinto.asciidoctor-vscode --force
    - runas: user
    - onlyif: which code && which wkhtmltopdf

code_settings_ext_asciidoctor:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text: '"asciidoc.wkhtmltopdf_path": "/usr/bin/wkhtmltopdf"'
    - require:
      - cmd: code_ext_asciidoctor
    - require_in:
      - file: code_settings

# Encode/Decode

code_ext_encode:
  cmd.run:
    - name: code --install-extension mitchdenny.ecdc --force
    - runas: user
    - onlyif: which code

# Git

code_ext_gitlens:
  cmd.run:
    - name: code --install-extension eamodio.gitlens --force
    - runas: user
    - onlyif: which code

# Settings

code_settings:
  file.managed:
    - name: /home/user/.config/Code/User/settings.json
    - source: salt://qubescusto/configs/code/files/settings.jinja
    - template: jinja
    - user: user
    - group: user
    - mode: 644
