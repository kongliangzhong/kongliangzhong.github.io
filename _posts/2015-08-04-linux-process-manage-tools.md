---
layout: post
title: "Linux 进程管理"
tags: linux process-supervision
categories: linux
---

## daemontools 

## supervisord  
   - supervisorctl  
   - supervisord will auto load all \*.conf file in /etc/supervisor/conf.d/\*.conf  
     (configured in /etc/supervisor/supervisord.conf, see the files section)  
   - supervisor conf example:  

        [program:nodehook]  
        command=/usr/bin/node /srv/http.js  
        directory=/srv  
        autostart=true  
        autorestart=true  
        startretries=3  
        stderr\_logfile=/var/log/webhook/nodehook.err.log  
        stdout\_logfile=/var/log/webhook/nodehook.out.log  
        user=root  
        environment=SECRET\_PASSPHRASE='this is secret',SECRET\_TWO='another secret'  

   run: **sudo supervisorctl update** to load new conf file.
