# My QubesOS Formulas

## Synchronize formulas and pillars to dom0

### !!! WARNING !!!

`dom0` is isolated from anything else and has no easy way to transfer stuff from a VM for a very good reason:

> A compromise of `dom0` implies a compromise of the entire system.

See https://www.qubes-os.org/doc/copy-from-dom0/#copying-to-dom0 for more details.

You should verify twice what you will copy to `dom0` and copy from a VM as safe as possible (disposable VM can be an option).

BEWARE this sync script pushes an entire folder hierarchy to `dom0`.

### What does sync script do

Sync script pulls pillars and formulas from source domain `<domain>` to `dom0` respective folders `/srv/pillar` and `/srv/salt`.

`qubescusto` folder is recursively copied (i.e. children are included) from respective source folders `qubesos-pillars` and `qubesos-formulas`.

### Deploy sync script

Move sync script to `dom0` by executing following command in `dom0` after replacing ${SRC_VM} and ${SRC_DIR} as per your environment:

```bash
qvm-run --pass-io ${SRC_VM} "cat ${SRC_DIR}/sync-dom0-from-vm.sh" > sync-dom0-from-vm.sh
chmod u+x sync-dom0-from-vm.sh
```

### Use sync script

Just execute the script with root privileges in `dom0`:

```bash
sudo ./sync-dom0-from-vm.sh <source-domain>
```

Get help
```bash
sudo ./sync-dom0-from-vm.sh -h
```

### Check if sync script worked

To check `qubescusto` is activated in pillars, use following command on `dom0`: `sudo qubesctl top.enabled pillar=true`.

Expected output:


To check `qubescusto` is activated in formulas, use following command on `dom0`: `sudo qubesctl top.enabled pillar=true`

Expected output:

### Apply state manually

Apply states to all domains: `sudo qubesctl --all state.highstate`

Apply states to only `<domain>`: `sudo qubesctl --targets <domain> state.hightstate`

Apply states to only `<domain>` without dom0 part (i.e. domain creation): `sudo qubesctl --skip-dom0 --targets <domain> state.hightstate`

Logs are under: `/var/log/qubes/mgmt-<domain>.log`

### Tips & Tricks for formulas

Cannot require a package in a VM (require: pkg: <id>) as package installation has been executed in the template (i.e. in another minion)

Get list of QVM modules properties: `/srv/salt/_modules/ext_module_qvm.py`

Get prefs of a VM: `sudo qubesctl qvm.prefs <domain>`

Get features of a VM: `sudo qubesctl qvm.features <domain>`

Get states applied to dom0: `sudo qubesctl state.show_highstate`

Get states applied to a domain (beware query will be executed on the minion): `sudo qubesctl --skip-dom0 --targets <domain> state.show_highstate`

Get pillars used on dom0 (beware data will be decrypted): `sudo qubesctl pillar.data`

Get pillars sent to a domain (beware query will be executed on the minion so data will be decrypted there): `sudo qubesctl --skip-dom0 --targets <domain> pillar.data`

## States

TODO

