https://github.com/bXV0ZQ/prezto.git:
  git.latest:
    - target: /home/user/.zprezto
    - user: user
    - rev: master
    - branch: master
    - submodules: True

# ZSH & prezto configuration

/home/user/.zlogin:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/zlogin
    - force: True

/home/user/.zlogout:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/zlogout
    - force: True

/home/user/.zpreztorc:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/zpreztorc
    - force: True

/home/user/.zprofile:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/zprofile
    - force: True

/home/user/.zshenv:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/zshenv
    - force: True

/home/user/.zshrc:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/zshrc
    - force: True

# Prowerlevel 10k configuration

/home/user/.p10k.zsh:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/p10k.zsh
    - force: True

# tmux configuration (enabled at prezto startup)

/home/user/.tmux.conf:
  file.symlink:
    - target: /home/user/.zprezto/runcoms/tmux.conf
    - force: True