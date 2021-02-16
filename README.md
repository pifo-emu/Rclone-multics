
**Este manual esta diseñado para crear copias de seguridad de nuestra configuración en Google Drive**

  

  

  

  

1.  **Preparación  
    IMPORTANTE EL VPS SERA REINICIADO DESPUÉS DE LA PREPARACIÓN**  
      
       apt update && apt upgrade -y && apt install curl unzip -y && /sbin/shutdown -r now
      
    **Esperamos que inicie el vps para seguir**  
      
    
2.  **Instalación rclone**  
      
    curl https://rclone.org/install.sh | bash  
    ![](https://fotos.subefotos.com/9c740f426db15566621fd98b9292cd24o.png)  
    
3.  **Configuración rclone**  
      
    **rclone config**  
    ![](https://fotos.subefotos.com/a6ac8b20d03bf25b213769eb4a338d54o.png)
    -   Escribimos **"n"** sin comillas, para crear nuevo remote
    -   name> ponemos el nombre que le queramos dar al remote, **Ejemplo:** name>Google-drive y le damos a la tecla enter  
        ![](https://fotos.subefotos.com/208347f47cbf4df0f7a93e5250de2087o.png)
    -   Escojemos Googl Drive poniendo el numero en Storage>  
        ![](https://fotos.subefotos.com/63275d610cf8dd88aac08b1759393c29o.png)  
          
        
    -   Storage> 15, damos a la tecla enter  
        ![](https://fotos.subefotos.com/da6ed4af4423db2899e1c7933a181b85o.png)  
          
        
    -   client_id> lo dejamos en blanco y damos enter
    -   client_secret> lo dejamos en blanco y damos enter  
        ![](https://fotos.subefotos.com/089684dec692cba3bb2431d9cfbf83afo.png)  
          
        
    -   scope> 1, presionamos enter  
          
        ![](https://fotos.subefotos.com/1757f86000e2aa8226dfaa1dcece5767o.png)  
          
        
    -   root_folder_id>lo dejamos en blanco y damos enter
    -   service_account_file> lo dejamos en blanco y damos enter  
          
        ![](https://fotos.subefotos.com/9a160a673e2db4aa8e9bfc7fdbd4cd02o.png)  
          
        
    -   Enter a string value. Press Enter for the default ("").  
        service_account_file>  
        Edit advanced config? (y/n)  
        y) Yes  
        n) No (default)  
        y/n> **n**  
          
          
        
    -   Remote config  
        Use auto config?  
        * Say Y if not sure  
        * Say N if you are working on a remote or headless machine  
        y) Yes (default)  
        n) No  
        y/n>**n  
          
        ![](https://fotos.subefotos.com/4648ea702f4eb8c130e5611edad8edf8o.png)  
        Copiamos el link y lo pegamos en el navegador e iniciamos sección en nuetsra cuenta de google  
          
        ![](https://fotos.subefotos.com/bf7a239eecc316e0e152569d5c002983o.png)  
        ![](https://fotos.subefotos.com/9d6d4794663ddb14d365efe979fa2f09o.png)  
        ![](https://fotos.subefotos.com/c5cd977b576aaea4ebab607d541fd813o.png)  
        Copiamos el código que nos da en la ultima captura y lo pegamos en la consola donde dice Enter verification code> y presionamos enter**  
          
        
    -   Configure this as a team drive?  
        y) Yes  
        n) No (default)  
        y/n> **n**  
          
          
        
    -   Luego nos saldrá algo parecido a esto  
          
        --------------------  
        [Google-drive]  
        type = drive  
        scope = drive  
        token = {"access_token":"un monton de letras, numeros, y signos"}  
        --------------------  
        y) Yes this is OK (default)  
        e) Edit this remote  
        d) Delete this remote  
        y/e/d>**y**  
          
        
    -   Current remotes:  
          
        Name Type  
        ==== ====  
        Google-drive drive  
          
        e) Edit existing remote  
        n) New remote  
        d) Delete remote  
        r) Rename remote  
        c) Copy remote  
        s) Set configuration password  
        q) Quit config  
        e/n/d/r/c/s/q>q  
          
        
    -   **Si Hemos llegado asta aquí ya tenemos el vps preparado y el rclone configurado por lo cual ya podemos proceder a crear, en este caso descargar y editar el script para copias de seguridad el cual ya deje preparado para simplificar la tarea  
        Yo recomiendo el que comprime**
4.  **Script Backups**
    -   **Script backups sube los archivos sin comprimir y los guarda en drive en una ruta por año mes y día ejemplo gogle.drive.com/NOMBRE_DE_CARPETA/AÑO/MES/DIA/  
        Para instalar**  
        wget https://pifo-emu.github.io/Rclone-multics/scritps.sh -O /etc/cron.daily/backups-drive.sh && chmod +x /etc/cron.daily/backups-drive.sh   
          
        
    -   **Recomendado**
    -   **Script backups sube los archivos comprimidos y los guarda en drive en una ruta por año ejemplo gogle.drive.com/NOMBRE_DE_CARPETA/AÑO/  
        Para instalar**  
        wget https://pifo-emu.github.io/Rclone-multics/scritps-comprimido.sh -O /etc/cron.daily/backups-drive.sh && chmod +x /etc/cron.daily/backups-drive.sh  
          
        
    -   **luego tendrás que editar el archivo /etc/cron.daily/backups-drive.sh**  
        nano /etc/cron.daily/backups-drive.sh
        **cambiamos los parámetros  
          
        #ESTO PUEDES EDITAR**  
        EMUDIR= /tu_ruta/ #Edita la ruta de tu configuración  
        CARPETA=Emuladora #Edita el nombre de la carpeta si quieres que sea distinta  
        REMOTE=google-drive #CAMBIA google-drive POR EL NOMBRE QUE PUSISTE EN EL PASO 1
5.  **Si todo salio bien el sistema realizara backups diarios en tu cuenta de Drive cualquier duda puedes consultar en este hilo*


