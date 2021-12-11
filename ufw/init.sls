ufw:
  pkg.installed

'ufw enable':
  cmd.run:
    - unless: 'ufw status | grep "Status: active"'

'ufw allow 22/tcp':
  cmd.run:
    - unless: 'sudo ufw status | grep 22/tcp' 
