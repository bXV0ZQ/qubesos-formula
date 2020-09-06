# Salt in use within Qubes OS is pretty old and still run under python 2...
# ... so using pip module doesn't work!!!
virtualenvwrapper-install:
  cmd.run:
    - name: pip install --user virtualenvwrapper
    - runas: user
    - unless: pip list --format freeze | grep "^virtualenvwrapper=="

virtualenvwrapper-uptodate:
  cmd.run:
    - name: pip install --user --upgrade virtualenvwrapper
    - runas: user
    - onlyif: pip list --outdated --format freeze | grep "^virtualenvwrapper=="
    - require:
      - cmd: virtualenvwrapper-install

# virtualenvwrapper:
#   pip.installed:
#     - name: virtualenvwrapper
#     - require:
#       - pkg: python-pip

# Salt in use within Qubes OS is pretty old and still run under python 2...
# ... so using pip module doesn't work!!!

pylint-install:
  cmd.run:
    - name: pip install --user pylint
    - runas: user
    - unless: pip list --format freeze | grep "^pylint=="

pylint-uptodate:
  cmd.run:
    - name: pip install --user --upgrade pylint
    - runas: user
    - onlyif: pip list --outdated --format freeze | grep "^pylint=="
    - require:
      - cmd: pylint-install

# pylint:
#   pip.installed:
#     - name: pylint
#     - require:
#       - pkg: python-pip
