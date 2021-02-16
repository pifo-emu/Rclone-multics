Este manual esta diseñado para crear copias de seguridad de nuestra configuración en Google Drive





    Preparación
    IMPORTANTE EL VPS SERA REINICIADO DESPUÉS DE LA PREPARACIÓN

    [CODE]apt update && apt upgrade -y && apt install curl unzip -y && /sbin/shutdown -r now[/CODE]

    Esperamos que inicie el vps para seguir

    Instalación rclone

    [CODE]curl https://rclone.org/install.sh | bash[/CODE]
     Configuración rclone

     [CODE]rclone config[/CODE]
        Escribimos  "n" sin comillas, para crear nuevo remote
        name> ponemos el nombre que le queramos dar al remote, Ejemplo: name>Google-drive y le damos a la tecla enter
        Escojemos Googl Drive poniendo el numero en Storage>


        Storage> 15, damos a la tecla enter


        client_id> lo dejamos en blanco y damos enter
        client_secret> lo dejamos en blanco y damos enter


        scope> 1, presionamos enter



        root_folder_id>lo dejamos en blanco y damos enter
        service_account_file> lo dejamos en blanco y damos enter



        Enter a string value. Press Enter for the default ("").
        service_account_file>
        Edit advanced config? (y/n)
        y) Yes
        n) No (default)
        y/n> n


        Remote config
        Use auto config?
        * Say Y if not sure
        * Say N if you are working on a remote or headless machine
        y) Yes (default)
        n) No
        y/n>n


        Copiamos el link y lo pegamos en el navegador e iniciamos sección en nuetsra cuenta de google




         Copiamos el código que nos da en la ultima captura y lo pegamos en la consola donde dice Enter verification code> y presionamos enter 

        Configure this as a team drive?
        y) Yes
        n) No (default)
        y/n> n


        Luego nos saldrá algo parecido a esto

        --------------------
        [Google-drive]
        type = drive
        scope = drive
        token = {"access_token":"un monton de letras, numeros, y signos"}
        --------------------
        y) Yes this is OK (default)
        e) Edit this remote
        d) Delete this remote
        y/e/d>y

        Current remotes:

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

        Si Hemos llegado asta aquí ya tenemos el vps preparado y el rclone configurado por lo cual ya podemos proceder a crear, en este caso descargar y editar el script para copias de seguridad el cual ya deje preparado para simplificar la tarea
         Yo recomiendo el que comprime 
    Script Backups
        Script backups sube los archivos sin comprimir y los guarda en drive en una ruta por año mes y día ejemplo gogle.drive.com/NOMBRE_DE_CARPETA/AÑO/MES/DIA/
         Para instalar
        [CODE]wget https://pifo-emu.github.io/Rclone-multics/scritps.sh -O /etc/cron.daily/backups-drive.sh && chmod +x /etc/cron.daily/backups-drive.sh [/CODE]

        Recomendado
        Script backups sube los archivos comprimidos y los guarda en drive en una ruta por año ejemplo gogle.drive.com/NOMBRE_DE_CARPETA/AÑO/
         Para instalar
        [CODE]wget https://pifo-emu.github.io/Rclone-multics/scritps-comprimido.sh -O /etc/cron.daily/backups-drive.sh && chmod +x /etc/cron.daily/backups-drive.sh [/CODE]

        luego tendrás que editar el archivo /etc/cron.daily/backups-drive.sh
        [CODE]nano /etc/cron.daily/backups-drive.sh[/CODE]
        cambiamos los parámetros

        #ESTO PUEDES EDITAR
        EMUDIR= /tu_ruta/ #Edita la ruta de tu configuración
        CARPETA=Emuladora #Edita el nombre de la carpeta si quieres que sea distinta
        REMOTE=google-drive #CAMBIA google-drive POR EL NOMBRE QUE PUSISTE EN EL PASO 1
    Si todo salio bien el sistema realizara backups diarios en tu cuenta de Drive cualquier duda puedes consultar en este hilo


