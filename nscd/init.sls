nscd:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: nscd
    - watch:
      - file: /etc/nscd.conf
      - pkg: nscd

/etc/nscd.conf:
  file:
    - name: /etc/nscd.conf
    - managed
    - user: root
    - group: root
    - mode: 600
    - source: salt://nscd/files/nscd.conf
    - require:
      - pkg: nscd
