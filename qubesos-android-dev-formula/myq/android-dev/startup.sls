{% set vmname = salt['grains.get']('nodename') %}

include:
  - myq.vm-startup.startup-script

android-dev-rc-local:
  file.blockreplace:
    - name: /rw/config/rc.local
    - source: salt://myq/android-dev/files/rc.local.block.sh.j2
    - template: jinja
    - context:
        vmname: {{ vmname }}
        udevrulesfile: {{ udevrulesfile }}
    - marker_start: '#### block-start - android-dev - managed - do not update manually'
    - marker_end: '#### block-stop - android-dev'
    - append_if_not_found: True
    - backup: False
    - require:
      - file: vm-startup-rc-local-init
