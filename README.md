# Oma moduuli miniprojekti kurssille: Palvelinten hallinta - ICT4TN022-3014

**Kurssi:** Tämä projekti on osa Tero Karvisen pitämää [Palvelinten hallinta ICT4TN022-3014](https://terokarvinen.com/2021/configuration-management-systems-palvelinten-hallinta-ict4tn022-2021-autumn/) -kurssia Haaga-Helia ammattikorkeakoulussa syksyllä 2021.

**Tekijä:** Tuuli Huhtanen - Haaga-Helia ammattikorkeakoulu - Tietojenkäsittelyn tradenomi-linja - 12/2021

**Raportti projektin eri vaiheista:** [Raportti h7 - Oma moduuli](https://github.com/tuuli-huhtanen/palvelintenhallinta/blob/main/h7-omamoduuli.md)

## Projektin tarkoitus - omat asetukset Ubuntu 20.04.3 LTS:lle                 

Tämä on moduuli, jota on tarkoitus käyttää alustamaan Ubuntu 20.04 LTS käyttöjärjestelmä omiin tarpeisiini. Jatkossa moduulia on tarkoitus kehittää niin, että sitä voi hyödyntää myös muille Debian -pohjaisille distroille ja tuleville Ubuntun LTS -päivityksille.

## Moduulin sisältö

```
/srv/salt
├── firefox
│   ├── firefox-esr.js
│   ├── init.sls
│   └── prefs.js
├── nano
│   └── init.sls
├── pkgs
│   └── init.sls
├── ssh
│   ├── init.sls
│   └── sshd_config
└── ufw
    └── init.sls

5 directories, 8 files
```

* firefox: salasanojen ehdottaminen ja generointi pois, kirjamerkkipalkista pois "Import bookmarks...", kotisivu [DuckDuckGo](https://duckduckgo.com), uusi välilehti tyhjä. 
* nano: rivi numerointi ja tekstin pehmeä jäsentäminen
* pkgs: bash-completion, tree, net-tools, git
* ssh: asentaa ja käynnistää, kuuntelee porttia 22
* ufw: asentaa ja aktivoi palomuurin, tekee ssh:lle reiän porttiin 22

## Ohjeet käyttöönottoon

Päivitä ja asenna Salt-minion Debian:

Päivitä ja asenna Salt-minion Ubuntu:

## Testausympäristö

* master: Debian 11, salt-version: salt 3002.6
* minion_ubuntu: Ubuntu 20.04.3 LTS, salt-version: salt-minion 3004
* minion_debian: Debian 11, salt-version: salt-minion 3002.6
* Host OS: Windows 11 Home
* Virtualbox version 6.1

Testiraportin ja kuvat lopputuloksesta löydät: [tuuli-huhtanen / palvelintenhallinta / h7-omamoduuli.md / 12.12.2021 Testit ja lopputulos](https://github.com/tuuli-huhtanen/palvelintenhallinta/blob/main/h7-omamoduuli.md#viides)

## Päivitysinfo

12.12.2021 Lisätty top.sls. Lisätty linkki testeihin ja kuviin lopputuloksesta. Kehitettävää: Firefoxin tracking off - ei toimi. Lisätty lähteet ja testiympäristö.

11.12.2021 - Päivitetty nano, ufw ja tuotu Firefox. Testattu osittain.

07.12.2021 - Ensimmäinen versio tuotu Githubiin. Testattu ajamalla Debian-11 masterilta Ubuntu 20.04.3:lle ja todettu muutoin toimivaksi, mutta ufw-moduulin ajon aikana ensimmäisen kerran aiheuttaa yhteyskatkon. 

## Lähteinä tämän moduulin rakentamisessa käytetty:

* [ pyllyukko / user.js](https://github.com/pyllyukko/user.js)
* [Saltproject: Salt Project Package Repo: Ubuntu](https://repo.saltproject.io/#ubuntu)
* [SaltStack: Glossary](https://docs.saltproject.io/en/latest/glossary.html)
* [SaltStack: salt.states.file.append](https://docs.saltproject.io/en/latest/ref/states/all/salt.states.file.html#salt.states.file.append)
* [SaltStack: salt.states.file](https://docs.saltproject.io/en/latest/ref/states/all/salt.states.file.html)
* [SaltStack: The top file](https://docs.saltproject.io/en/latest/ref/states/top.html)
* [samikul / PalvelintenHallinta-ICT4TN022-3011](https://github.com/samikul/PalvelintenHallinta-ICT4TN022-3011/)
* [Tero Karvinen: Firefox System Wide Settings – /etc/firefox/syspref.js](https://terokarvinen.com/2016/firefox-system-wide-settings-etcfirefoxsyspref-js/)
* [Tero Karvinen: Palvelinten hallinta - ICT4TN022-3014 - 2021 late autumn](https://terokarvinen.com/2021/configuration-management-systems-palvelinten-hallinta-ict4tn022-2021-autumn/)
* [Tero Karvinen: Salt Quickstart – Salt Stack Master and Slave on Ubuntu Linux](https://terokarvinen.com/2018/salt-quickstart-salt-stack-master-and-slave-on-ubuntu-linux/)
* [Ubuntu documentation: ufw](https://help.ubuntu.com/community/UFW)
