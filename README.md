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

Päivitä ja tuo Salt-master Debianille: 

```
$ sudo apt-get update
$ sudo apt-get -y install salt-master
```

Päivitä ja asenna Salt-minion Debianille: (jokoa sama tai eri kone)

```
$ sudo apt-get update
$ sudo apt-get -y install salt-minion
$ sudoedit /etc/salt/minion

```

Muokkaa tiedostoon:

```
master: #master-koneen IP-osoite
id: #minionin id, joka näkyy masterilla, esim. debian-minion
```

Käynnistä daemoni uudelleen:

```
$ sudo systemctl restart salt-minon.service
```

Päivitä ja asenna Salt-minion Ubuntu:

```
$ sudo apt-get update
$ sudo apt-get install curl 
$ sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/ubuntu/20.04/arm64/latest/salt-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=arm64] https://repo.saltproject.io/py3/ubuntu/20.04/arm64/latest focal main" | sudo tee /etc/apt/sources.list.d/salt.list
deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=arm64] https://repo.saltproject.io/py3/ubuntu/20.04/arm64/latest focal main
$ sudo apt-get install salt-minion
$ sudoedit /etc/salt/minion
```

Muokkaa tiedostoon:

```
master: #master-koneen IP-osoite
id: #minionin id, joka näkyy masterilla, esim. ubuntu-minion
```

Käynnistä daemoni uudelleen:

```
$ sudo systemctl restart salt-minon.service
```

Masterilla hyväksy avaimet:

```
$ sudo salt-key -A
```

Kloonaa repositorio masterille:

```
git clone https://github.com/tuuli-huhtanen/palvelintenhallinta-moduuli.git
```

Luo hakemisto:

```
$ sudo mkdir -p /srv/salt
```

Ja vie sinne kloonatusta repositoriosta moduulit ja `top.sls` niin, että rakenne näyttää näyttää samalta kuin kohdassa "Moduulin sisältö".

Voit ajaa joko yksittäisen moduulin osan tietylle minionille seuraavasti:

```
$ sudo salt 'ubuntu-minion' state.apply ufw
```

Tai koko moduulin kaikille minioneille:

```
$ sudo salt '*' state.apply
```

## Testausympäristö

* master: Debian 11, salt-version: salt 3002.6
* minion_ubuntu: Ubuntu 20.04.3 LTS, salt-version: salt-minion 3004
* minion_debian: Debian 11, salt-version: salt-minion 3002.6
* Host OS: Windows 11 Home
* Virtualbox version 6.1

Testiraportin ja kuvat lopputuloksesta löydät: [tuuli-huhtanen / palvelintenhallinta / h7-omamoduuli.md / 12.12.2021 Testit ja lopputulos](https://github.com/tuuli-huhtanen/palvelintenhallinta/blob/main/h7-omamoduuli.md#viides)

## Päivitysinfo

13.12.2021 Lisätty ohjeet käyttöönottoon ja projekti palautettu opettajalle.

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
