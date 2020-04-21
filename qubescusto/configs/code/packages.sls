# Visual Studio Code

code_repo:
  pkgrepo.managed:
    - name: code
    - humanname: Visual Studio Code
    - baseurl: https://packages.microsoft.com/yumrepos/vscode
    - enabled: True
    - gpgcheck: 1
    - gpgkey: https://packages.microsoft.com/keys/microsoft.asc
    - require_in:
      - pkg: code

code:
  pkg.installed:
    - version: latest

wkhtmltopdf:
  pkg.installed:
    - version: latest