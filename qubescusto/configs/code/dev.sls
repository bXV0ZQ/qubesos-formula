include:
  - qubescusto.configs.code

# jq

code-ext-jq:
  cmd.run:
    - name: code --install-extension davidnussio.vscode-jq-playground --force
    - runas: user
    - onlyif: which code

# jinja

code-ext-jinja:
  cmd.run:
    - name: code --install-extension samuelcolvin.jinjahtml --force
    - runas: user
    - onlyif: which code
