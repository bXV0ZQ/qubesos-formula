include:
  - qubescusto.domains.dev.config

{% set udevrulesfile = '/rw/config/51-dev-phone.rules' %}

android-sdk-folder:
  file.directory:
    - name: /usr/local/android-sdk/cmdline-tools
    - makedirs: True

android-sdk-install:
  archive.extracted:
    - name: /usr/local/android-sdk/cmdline-tools
    - source: https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
    - source_hash: 2ff01336f5294471b3c2836f0f134e607239e3300f891a0edf3089977a799ea3415b61e5ec47480b69eead8457b09ac56951dc10bf11dc642c2a9f2c41ac629a
    - keep_source: False
    - clean: True
    - use_cmd_unzip: True
    - if_missing: /usr/local/android-sdk/cmdline-tools/latest
    - trim_output: 5
    - require:
      - file: android-sdk-folder

android-sdk-cmdline-tools:
  file.rename:
    - name: /usr/local/android-sdk/cmdline-tools/latest
    - source: /usr/local/android-sdk/cmdline-tools/tools
    - force: True
    - require:
      - archive: android-sdk-install

android-sdk-cmdline-tools-sdkmanager:
  file.symlink:
    - name: /usr/local/bin/sdkmanager
    - target: /usr/local/android-sdk/cmdline-tools/latest/bin/sdkmanager
    - force: True
    - require:
      - file: android-sdk-cmdline-tools

android-sdk-licenses:
  cmd.run:
# Fails with "yes: standard output: Broken pipe" if 'yes' error output is not redirected to '/dev/null'
# See https://stackoverflow.com/questions/20573282/hudson-yes-standard-output-broken-pipe for more details
    - name: yes 2> /dev/null | sdkmanager --licenses > /dev/null
    - unless: ls /usr/local/android-sdk/licenses
    - require:
      - file: android-sdk-cmdline-tools-sdkmanager

android-sdk-platform-tools:
  cmd.run:
    - name: sdkmanager "platform-tools" > /dev/null
    - require:
      - cmd: android-sdk-licenses

android-sdk-platform-tools-adb:
  file.symlink:
    - name: /usr/local/bin/adb
    - target: /usr/local/android-sdk/platform-tools/adb
    - force: True
    - require:
      - cmd: android-sdk-platform-tools

android-sdk-platform-tools-fastboot:
  file.symlink:
    - name: /usr/local/bin/fastboot
    - target: /usr/local/android-sdk/platform-tools/fastboot
    - force: True
    - require:
      - cmd: android-sdk-platform-tools

dev-phone-rc-local:
  file.managed:
    - name: /rw/config/rc.local
    - source: salt://qubescusto/domains/dev/phone/files/rc.local.sh.j2
    - template: jinja
    - context:
        udevrulesfile: {{ udevrulesfile }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: dev-phone-android-udev-rules

dev-phone-android-udev-rules:
  file.managed:
    - name: {{ udevrulesfile }}
    - source: salt://qubescusto/domains/dev/phone/files/51-dev-phone.android.udev-rules.sh.j2
    - template: jinja
    - context:
        phonevm: dev-phone
        phonerefs: {{ salt['pillar.get']('dev:phone:phonerefs', []) }}
    - user: root
    - group: root
    - mode: 755
