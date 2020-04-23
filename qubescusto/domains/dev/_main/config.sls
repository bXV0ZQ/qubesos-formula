include:
  - qubescusto.domains.dev.config

# SaltStack dev

code-settings-saltstack:
  file.accumulated:
    - name: code_settings_files_associations
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - '"*.sls": "yaml"'
      - '"*.top": "yaml"'
    - require_in:
      - file: code-settings
