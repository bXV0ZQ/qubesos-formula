include:
  - qubescusto.configs.zsh
  - qubescusto.configs.git.dev
  - qubescusto.configs.code.dev

# SaltStack dev

code_settings_saltstack:
  file.accumulated:
    - name: code_settings_files_associations
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - '"*.sls": "yaml"'
      - '"*.top": "yaml"'
    - require_in:
      - file: code_settings
