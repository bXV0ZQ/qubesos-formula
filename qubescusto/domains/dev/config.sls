include:
  - qubescusto.configs.code.dev
  - qubescusto.configs.zsh
  - qubescusto.configs.github.dev

# SaltStack dev

code_settings_saltstack:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - |
        "files.associations": {
            "*.sls": "yaml",
            "*.top": "yaml"
        }
    - require_in:
      - file: code_settings
