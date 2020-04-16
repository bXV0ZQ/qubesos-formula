## Synchronize states to dom0

### !!! WARNING !!!

`dom0` is isolated from anything else and has no easy way to transfer stuff from a VM for a very good reason:

> A compromise of `dom0` implies a compromise of the entire system.

See https://www.qubes-os.org/doc/copy-from-dom0/#copying-to-dom0 for more details.

You should verify twice what you will copy to `dom0` and copy from a VM as safe as possible (disposable VM can be an option).

BEWARE this sync script pushes an entire folder hierarchy to `dom0`.

### What does sync script do

Sync script pulls `qubescusto.top` and `qubescusto` folder recursively (i.e. children are included) into `/srv/salt` folder in `dom0`

Edit sync script `sync-dom0-from-vm.sh` to update variables as per your environment.

### Deploy sync script

Move sync script to `dom0` by executing following command in `dom0` after replacing ${SRC_VM} and ${SRC_DIR} as per your environment:

```bash
qvm-run --pass-io ${SRC_VM} "cat ${SRC_DIR}/sync-dom0-from-vm.sh" > sync-dom0-from-vm.sh
chmod u+x sync-dom0-from-vm.sh
```

### Use sync script

Just execute the script with root privileges in `dom0`:

```bash
sudo ./sync-dom0-from-vm.sh
```

## TODO

Enable dev top file: `sudo qubesctl top.enable qubescusto.dev`

Can also disable existing one: `sudo qubesctl top.disable topd.top`

Check dev top file is enabled: `sudo qubesctl top.enabled`

Apply states to all domains: `sudo qubesctl --all state.highstate`

Apply states to only tmpl-dev: `sudo qubesctl --targets tmpl-dev state.hightstate`

Apply states to only tmpl-dev without dom0: `sudo qubesctl --skip-dom0 --targets tmpl-dev state.hightstate`

Display logs: `sudo cat /var/log/qubes/mgmt-tmpl-dev.log`



Enable qubescusto pillar file: `sudo qubesctl top.enable qubescusto pillar=true`

Check qubescusto pillar file is enabled: `sudo qubesctl top.enabled pillar=true`

Can also disable qubescusto pillar file: `sudo qubesctl top.disable qubescusto pillar=true`



## TODO TIPS

Cannot require a package in a VM (require: pkg: <id>) as package installation has been executed in the template (i.e. in another minion)
