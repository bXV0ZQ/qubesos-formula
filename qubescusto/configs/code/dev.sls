include:
  - qubescusto.configs.code

# jq

code_ext_jq:
  cmd.run:
    - name: code --install-extension davidnussio.vscode-jq-playground --force
    - runas: user
    - onlyif: which code

# SaltStack dev

code_settings_saltstack:
  file.accumulated:
    - name: code_settings
    - filename: /home/user/.config/Code/User/settings.json
    - text:
      - |
        '"files.associations": {
            "*.sls": "yaml",
            "*.top": "yaml"
        }'
    - require_in:
      - file: code_settings