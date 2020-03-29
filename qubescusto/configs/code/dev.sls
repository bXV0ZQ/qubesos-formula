include:
    - qubescusto.configs.code

code_ext_jq:
    cmd.run:
        - name: code --install-extension davidnussio.vscode-jq-playground --force
        - runas: user
        - onlyif: which code