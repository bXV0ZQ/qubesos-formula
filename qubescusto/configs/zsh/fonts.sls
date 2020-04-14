font_powerlevel10k_regular:
  file.managed:
    - name: /usr/share/fonts/meslolgsnf/MesloLGS NF Regular.ttf
    - source: salt://qubescusto/configs/zsh/files/MesloLGS NF Regular.ttf
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - require_in:
      - cmd: font_cache_reload

font_powerlevel10k_bold:
  file.managed:
    - name: /usr/share/fonts/meslolgsnf/MesloLGS NF Bold.ttf
    - source: salt://qubescusto/configs/zsh/files/MesloLGS NF Bold.ttf
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - require_in:
      - cmd: font_cache_reload

font_powerlevel10k_italic:
  file.managed:
    - name: /usr/share/fonts/meslolgsnf/MesloLGS NF Italic.ttf
    - source: salt://qubescusto/configs/zsh/files/MesloLGS NF Italic.ttf
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - require_in:
      - cmd: font_cache_reload

font_powerlevel10k_bolditalic:
  file.managed:
    - name: /usr/share/fonts/meslolgsnf/MesloLGS NF Bold Italic.ttf
    - source: salt://qubescusto/configs/zsh/files/MesloLGS NF Bold Italic.ttf
    - user: user
    - group: user
    - mode: 644
    - makedirs: True
    - require_in:
      - cmd: font_cache_reload

font_cache_reload:
  cmd.run:
    - name: fc-cache -v
    - runas: user