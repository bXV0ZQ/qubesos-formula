include:
  - qubescusto.configs.vscode

# Git

vscode-ext-gitlens:
  cmd.run:
    - name: code --install-extension eamodio.gitlens --force
    - runas: user
    - onlyif: which code
    - unless: "code --list-extensions | grep \"^eamodio.gitlens$\""

# jq

vscode-ext-jq:
  cmd.run:
    - name: code --install-extension davidnussio.vscode-jq-playground --force
    - runas: user
    - onlyif: which code
    - unless: "code --list-extensions | grep \"^davidnussio.vscode-jq-playground$\""

# jinja

vscode-ext-jinja:
  cmd.run:
    - name: code --install-extension samuelcolvin.jinjahtml --force
    - runas: user
    - onlyif: which code
    - unless: "code --list-extensions | grep \"^samuelcolvin.jinjahtml$\""

# python

vscode-ext-python:
  cmd.run:
    - name: code --install-extension ms-python.python --force
    - runas: user
    - onlyif: which code
    - unless: "code --list-extensions | grep \"^ms-python.python$\""
