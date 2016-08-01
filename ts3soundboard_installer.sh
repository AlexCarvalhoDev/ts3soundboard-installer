#!/bin/bash

echo -e ' ';

echo -e '\e[1m\e[32mScript Developed by:\e[0m';

echo -e ' ';

echo -e '\e[1m\e[31m    ____  _  _ _____ _______  __\e[0m';
echo -e '\e[1m\e[31m   |  _ \| || |_   _|___ /\ \/ /\e[0m';
echo -e '\e[1m\e[31m   | |_) | || |_| |   |_ \ \  / \e[0m';
echo -e '\e[1m\e[31m   |  __/|__   _| |  ___) |/  \ \e[0m';
echo -e '\e[1m\e[31m   |_|      |_| |_| |____//_/\_\ \e[0m';
echo -e '\e[1m\e[32m(SysAdmin and Amateur PHP Developer)\e[0m';

echo -e ' ';

read -r -p "Quer começar a instalação do Script? [y/N]" response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo -e '\e[1m\e[31mO Script irá começar a Instalação...\e[0m';
else
    exit 1;
fi

echo -e ' ';

echo -e '\e[1m\e[31mA instalar o TS3SoundBoard (Painel de 6 Instâncias)...\e[0m';

echo -e ' ';

echo -e '\e[1m\e[32m-> A fazer UPDATE...\e[0m';
	sudo apt-get update;
echo -e '\e[1m\e[32m-> A instalar as dependências...\e[0m';
	sudo apt-get install x11vnc xinit xvfb libxcursor1 ca-certificates bzip2 curl;
echo -e '\e[1m\e[32m-> A fazer UPDATE aos Certificados CA...\e[0m';
	sudo update-ca-certificates;
echo -e '\e[1m\e[32m-> A instalar o pactote libglib2.0-0...\e[0m';
	sudo apt-get install libglib2.0-0;
echo -e '\e[1m\e[32m-> A criar a diretoria /opt...\e[0m';
        sudo mkdir -p /opt;
echo -e '\e[1m\e[32m-> A dar permição 777 à diretoria /opt...\e[0m';
        sudo chmod 777 /opt;
        cd /opt;
echo -e '\e[1m\e[32m-> A fazer o download do TS3SoundBoard...\e[0m';
        wget http://alexandrecarvalho.xyz/files/ts3soundboardbot-0.9.5.tar.bz2;
echo -e '\e[1m\e[32m-> A descompactar o ficheiro do TS3SoundBoard (que contem a pasta /opt/ts3soundboard)...\e[0m';
        tar -xf ts3soundboardbot-0.9.5.tar.bz2;
echo -e '\e[1m\e[32m-> A remover o ficheiro original (compactado)...\e[0m';
        rm ts3soundboardbot-0.9.5.tar.bz2;
        cd ts3soundboard;
echo -e '\e[1m\e[32m-> A fazer o download do TeamSpeak3-Client-linux_amd64...\e[0m';
        wget http://dl.4players.de/ts/releases/3.0.18.2/TeamSpeak3-Client-linux_amd64-3.0.18.2.run;
echo -e '\e[1m\e[32m-> A dar permição 755 ao .RUN do TeamSpeak3-Client-linux_amd64...\e[0m';
        chmod 0755 TeamSpeak3-Client-linux_amd64-3.0.18.2.run;
echo -e '\e[1m\e[36m-> Está na hora de Instalar o TeamSpeak3-Client-linux_amd64. Clique: [ENTER + q + y + ENTER]...\e[0m';
        ./TeamSpeak3-Client-linux_amd64-3.0.18.2.run;
echo -e '\e[1m\e[32m-> A remover o .RUN do TeamSpeak3-Client-linux_amd64...\e[0m';
        rm -rf TeamSpeak3-Client-linux_amd64-3.0.18.2.run;
echo -e '\e[1m\e[32m-> A copiar o plugin do TS3SoundBoard para a diretoria de plugins do TeamSpeak3-Client-linux_amd64...\e[0m';
        cp libsoundbot_plugin.so /opt/ts3soundboard/TeamSpeak3-Client-linux_amd64/plugins;
echo -e '\e[1m\e[32m-> A instalar o Youtube-DL\e[0m';
        curl https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl;
        chmod a+rx /usr/local/bin/youtube-dl;
echo -e '\e[1m\e[32m-> A escrever o Youtube-DL no ficheiro config.ini';
        echo 'YoutubeDLPath = "/usr/local/bin/youtube-dl"' >> config.ini;
echo -e '\e[1m\e[32m-> A dar permição 777 a toda a diretoria...\e[0m';
        chmod 777 ../ts3soundboard;
        chmod -R 777 *;
echo -e '\e[1m\e[32m-> A fazer UPDATE ao TS3SoundBoard...\e[0m';
        ./ts3bot -update;
echo -e '\e[1m\e[32m-> A instalar o SCREEN...\e[0m';        
     	apt-get install screen;
        cd /opt/ts3soundboard;
echo -e '\e[1m\e[32m-> Instalação Completa!\e[0m';

echo -e ' ';

echo -e '\e[1m\e[31m+-----------------------------------------------------------------------------------------+\e[0m';
echo -e '\e[1m\e[31m|   \e[32mComando para iniciar o TS3SoundBoard:                                                 \e[31m|\e[0m';
echo -e '\e[1m\e[31m|   \e[32mscreen xinit /opt/ts3soundboard/ts3bot -- /usr/bin/Xvfb :2 -screen 0 800x600x16 -ac   \e[31m|\e[0m';
echo -e '\e[1m\e[31m+-----------------------------------------------------------------------------------------+\e[0m';

echo -e ' ';
