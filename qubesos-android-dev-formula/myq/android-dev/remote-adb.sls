android-dev-qubes-rpc-remote-adb-start:
  file.managed:
    - name: /etc/qubes-rpc/android.dev.StartRemoteADB
    - source: salt://myq/android-dev/files/qubes-rpc.remote-adb-start.sh.j2
    - template: jinja
    - context:
        usbvm: {{ pillar['roles']['usbvm'] }}
    - user: root
    - group: root
    - mode: 755

android-dev-qubes-rpc-remote-adb-start-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/android.dev.StartRemoteADB
    - source: salt://myq/android-dev/files/qubes-rpc-policy.remote-adb.sh.j2
    - template: jinja
    - user: root
    - group: qubes
    - mode: 664

android-dev-qubes-rpc-remote-adb-stop:
  file.managed:
    - name: /etc/qubes-rpc/android.dev.StopRemoteADB
    - source: salt://myq/android-dev/files/qubes-rpc.remote-adb-stop.sh.j2
    - template: jinja
    - context:
        usbvm: {{ pillar['roles']['usbvm'] }}
    - user: root
    - group: root
    - mode: 755

android-dev-qubes-rpc-remote-adb-stop-policy:
  file.managed:
    - name: /etc/qubes-rpc/policy/android.dev.StopRemoteADB
    - source: salt://myq/android-dev/files/qubes-rpc-policy.remote-adb.sh.j2
    - template: jinja
    - user: root
    - group: qubes
    - mode: 664
