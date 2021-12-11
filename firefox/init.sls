{% if grains['os'] == 'Ubuntu' %}
/etc/firefox/syspref.js:
  file.managed:
    - source: salt://firefox/prefs.js
{% endif %}

{% if grains['os'] == 'Debian' %}
/etc/firefox-esr/firefox-esr.js:
  file.managed:
    - source: salt://firefox/firefox-esr.js
{% endif %}
