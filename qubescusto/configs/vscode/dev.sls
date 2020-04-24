include:
  - qubescusto.configs.vscode

# jq

vscode-ext-jq:
  cmd.run:
    - name: code --install-extension davidnussio.vscode-jq-playground --force
    - runas: user
    - onlyif: which code

# jinja

vscode-ext-jinja:
  cmd.run:
    - name: code --install-extension samuelcolvin.jinjahtml --force
    - runas: user
    - onlyif: which code
