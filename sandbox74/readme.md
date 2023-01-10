Docker compose for sandbox php 7.4, mariadb 10.6.11

**Prerequisite:** 

  * Git credentials should be in your user profile

  * hosts file to have below entry 
  
  127.0.0.1 sandbox.taskmasterpro.com staticsandbox.taskmasterpro.com sandbox2.taskmasterpro.com sandbox3.taskmasterpro.com

**Install steps**

* Go to C:\

* Open gitbash here

* Run
$ git clone https://github.com/TaskMasterPro/tmp_deploy

* Run powershell as an administrator

* cd C:\tmp_deploy\sandbox74\deploy74

* Run docker compose build

![image](https://user-images.githubusercontent.com/104414289/211501120-43dd0728-b314-4236-bc07-09cf4b481d03.png)

This should complete without errors.

* Run docker compose up

![image](https://user-images.githubusercontent.com/104414289/211501401-6b5fc098-9be2-4250-863d-397851e61e57.png)

It will ask for permission, give it.

![image](https://user-images.githubusercontent.com/104414289/211501786-9adf434f-aa09-414a-8848-d219b628ca9c.png)

This will bring up the webserver sandbox, db server and adminer.

* Verify db server by loggin into adminer from 
http://localhost:8050/
server sql.taskmasterpro.com
username root
password <from docker-compose.yml>

![image](https://user-images.githubusercontent.com/104414289/211504354-900f111e-a60d-4f0e-99c6-845ddce6642c.png)

![image](https://user-images.githubusercontent.com/104414289/211504485-902dff0f-8b4a-4e08-80d3-c4e915a7cb43.png)

* Verify webserver 
  http://localhost:8081/
* PHPinfo http://localhost:8081/phpin.php

* login to sandbox with your cmd using following command 
 
 docker exec -it sandbox bash
* Install mcrypt  
 pecl install mcrypt  
 docker-php-ext-enable mcrypt  
 service apache2 reload
* Install apcu  
 pecl install apcu  
 docker-php-ext-enable apcu  
 service apache2 reload
 



