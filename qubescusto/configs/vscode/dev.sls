include:
  - qubescusto.configs.vscode

# Git

vscode-ext-gitlens:
  cmd.run:
    - name: code --install-extension eamodio.gitlens --force
    - runas: user
    - onlyif: which code

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
