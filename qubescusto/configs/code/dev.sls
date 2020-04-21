include:
  - qubescusto.configs.code

# jq

code_ext_jq:
  cmd.run:
    - name: code --install-extension davidnussio.vscode-jq-playground --force
    - runas: user
    - onlyif: which code

# jinja

code_ext_jinja:
  cmd.run:
    - name: code --install-extension samuelcolvin.jinjahtml --force
    - runas: user
    - onlyif: which code
