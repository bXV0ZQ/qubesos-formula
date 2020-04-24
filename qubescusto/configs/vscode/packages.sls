# Visual Studio Code

vscode-repo:
  pkgrepo.managed:
    - name: vscode
    - humanname: Visual Studio Code
    - baseurl: https://packages.microsoft.com/yumrepos/vscode
    - enabled: True
    - gpgcheck: 1
    - gpgkey: https://packages.microsoft.com/keys/microsoft.asc
    - require_in:
      - pkg: vscode

vscode:
  pkg.installed:
    - name: code
    - version: latest

wkhtmltopdf:
  pkg.installed:
    - version: latest