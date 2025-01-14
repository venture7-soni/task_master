Docker compose for sandbox php 7.4, mariadb 10.6.11

**Prerequisite:**  
  * Git credentials should be in your user profile  
  * hosts file to have below entry   
  127.0.0.1 sandbox.taskmasterpro.com staticsandbox.taskmasterpro.com sandbox2.taskmasterpro.com sandbox3.taskmasterpro.com  
  Comment the entry with sandbox you already have.
  
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
* Copy mysql cnf file 
  ``` 
  cp /var/taskmasterpro/sandbox/config/home/.my.cnf ~/.my.cnf
  ```
* You should be able to login to mysql without and credentials now  
![image](https://user-images.githubusercontent.com/104414289/211586181-95d2594a-b096-4a57-9cc7-d1cbf7460f19.png)  
* Clone tmp repo in sandbox directory with gitbash  
  ``` 
  git clone https://github.com/TaskMasterPro/tmp  
  ```
 ![image](https://user-images.githubusercontent.com/104414289/211746087-4d27d95a-2f9d-4c84-b00c-9110a97f1374.png)
* If you are installing for the first time, create Dbs with this script, Run from docker sandbox bash terminal  
  ```
  ./create_db.sh
  ```
* Run setup.sh from docker sandbox bash  
  ``` 
  ./setup.sh  
  ```
 ![image](https://user-images.githubusercontent.com/104414289/211754432-afb8720a-cc41-4dd9-a74c-46c3fd0f96e3.png)  
 This will create necessary config.  
* Import latest db dumps.  
 copy db dumps to sandbox folder and then do the import  
 ![image](https://user-images.githubusercontent.com/104414289/211758008-7df7b4bd-4d48-419a-a5cf-1138e4a5c257.png)  
 * TODO: Everything below should go into some local build script
 * From docker terminal, tmp folder, do npm install  
 ```
 npm install  
 ```
 ![image](https://user-images.githubusercontent.com/104414289/211765430-ea83a28d-ad10-46e9-b65c-27942f529637.png)
 * From docker terminal, tmp/laravel folder, do npm install  
 ```
 npm install  
 ```
 ![image](https://user-images.githubusercontent.com/104414289/211769241-fabef5fb-9288-4f5c-a3a5-40ff5397a9f2.png)  
 * From docker terminal, tmp/code, do composer install  
 ``` 
 /usr/local/bin/composer install --optimize-autoloader --no-progress --no-dev  
 ```
 ![image](https://user-images.githubusercontent.com/104414289/211790328-79008e67-46c7-4139-b17c-70e3aa90f755.png)
 * From docker terminal, tmp/laravel, do composer install  
 ```
 /usr/local/bin/composer install --optimize-autoloader --no-progress --no-dev  
 ```
 ![image](https://user-images.githubusercontent.com/104414289/211794748-5c0b2482-0162-4766-b075-a1860ef0c4e9.png)
 * From docker terminal, tmp/laravel, run following commands:  
  ```      
  php artisan key:generate  
  ```
  ```
  php artisan config:cache  
  ```
  ``` 
  php artisan config:clear  
  ```
 * FROM docker terminal, tmp/, run grunt  
  ```   
  grunt compass:dev  
  ```
 ![image](https://user-images.githubusercontent.com/104414289/211796052-977745f3-0977-4228-b085-e83a833a0644.png)
 * From gitbash terminal, run  
 ``` 
 npm run dev
 ```
 ![image](https://user-images.githubusercontent.com/104414289/211796504-30bb849c-2374-47ad-bcb5-f636bfda543f.png)
* Sandbox should be accessible on 8091 port  
 https://sandbox.taskmasterpro.com:8091/login.php
* To enable Xdebug 3, add the following lines at the end of 	/usr/local/etc/php/php.ini  
 xdebug.mode=develop,debug  
 xdebug.client_host=host.docker.internal  

**Adminui:** 
* Host file shoul have the entry 127.0.0.1 admin.sandbox.taskmasterpro.com
* To install adminui, git clone adminui in tmp_deploy\sandbox74\sandbox\admin. 
* Do composer install 
* Edit .env file 
* You should be able to access at https://admin.sandbox.taskmasterpro.com:8091/ 
 

 **Troubleshooting:**
 * If you run from containers from docker desktop, all the logs are outputed to the screen
 * If you run from poweshell, all the logs will be outputed to console
 * Use editor debugger

 
 


 



