code_ext_icons:
    cmd.run:
        - name: code --install-extension pkief.material-icon-theme --force
        - runas: user
        - onlyif: which code

code_ext_asciidoctor:
    cmd.run:
        - name: code --install-extension joaompinto.asciidoctor-vscode --force
        - runas: user
        - onlyif: which code

code_ext_encode:
    cmd.run:
        - name: code --install-extension mitchdenny.ecdc --force
        - runas: user
        - onlyif: which code

code_ext_gitlens:
    cmd.run:
        - name: code --install-extension eamodio.gitlens --force
        - runas: user
        - onlyif: which code
