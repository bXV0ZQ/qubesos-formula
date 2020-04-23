zsh-config-repo:
  git.latest:
    - name: https://github.com/bXV0ZQ/prezto.git
    - target: /home/user/.zprezto
    - user: user
    - rev: master
    - branch: master
    - submodules: True

# ZSH & prezto configuration

zsh-config-zlogin:
  file.symlink:
    - name: /home/user/.zlogin
    - target: /home/user/.zprezto/runcoms/zlogin
    - force: True

zsh-config-zlogout:
  file.symlink:
    - name: /home/user/.zlogout
    - target: /home/user/.zprezto/runcoms/zlogout
    - force: True

zsh-config-zpreztorc:
  file.symlink:
    - name: /home/user/.zpreztorc
    - target: /home/user/.zprezto/runcoms/zpreztorc
    - force: True

zsh-config-zprofile:
  file.symlink:
    - name: /home/user/.zprofile
    - target: /home/user/.zprezto/runcoms/zprofile
    - force: True

zsh-config-zshenv:
  file.symlink:
    - name: /home/user/.zshenv
    - target: /home/user/.zprezto/runcoms/zshenv
    - force: True

zsh-config-zshrc:
  file.symlink:
    - name: /home/user/.zshrc
    - target: /home/user/.zprezto/runcoms/zshrc
    - force: True

# Prowerlevel 10k configuration

zsh-config-prompt:
  file.symlink:
    - name: /home/user/.p10k.zsh
    - target: /home/user/.zprezto/runcoms/p10k.zsh
    - force: True

# tmux configuration (enabled at prezto startup)

zsh-config-tmux:
  file.symlink:
    - name: /home/user/.tmux.conf
    - target: /home/user/.zprezto/runcoms/tmux.conf
    - force: True