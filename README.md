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

* firefox: 
* nano: rivi numerointi ja tekstin pehmeä jäsentäminen
* pkgs: bash-completion, tree, net-tools, git
* ssh: asentaa ja käynnistää, kuuntelee porttia 22
* ufw: asentaa ja aktivoi palomuurin, tekee ssh:lle reiän porttiin 22

## Ohjeet käyttöönottoon

Päivitä ja asenna Salt-minion Debian:

Päivitä ja asenna Salt-minion Ubuntu:

## Testausympäristö

* master: Debian 11, salt-version:
* minion_ubuntu: Ubuntu 20.04.3 LTS, salt-version:
* minion_debian: Debian 11, salt-version:

Lopputulos kuvina:



## Päivitysinfo

11.12.2021 - Päivitetty nano, ufw ja tuotu Firefox. Testattu osittain.

07.12.2021 - Ensimmäinen versio tuotu Githubiin. Testattu ajamalla Debian-11 masterilta Ubuntu 20.04.3:lle ja todettu muutoin toimivaksi, mutta ufw-moduulin ajon aikana ensimmäisen kerran aiheuttaa yhteyskatkon. 
