{% from "nscd/map.jinja" import nscd_map with context %}

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
  file:
    - name: /etc/nscd.conf
    - managed
    - user: root
    - group: root
    - mode: 600
    - source: salt://nscd/files/nscd.conf
    - template: jinja
    - context:
      nscd_map: {{ nscd_map }}
    - require:
      - pkg: nscd
