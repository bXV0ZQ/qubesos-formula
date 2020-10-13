# Make sure ssh-agent is present and up-to-date
openssh-clients:
  pkg.installed:
    - version: latest