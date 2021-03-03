#!/bin/sh

#ESTO PUEDES EDITAR
EMUDIR=/tu_ruta/ #Edita la ruta de tu configuraci�n
CARPETA=Emuladora #Edita el nombre de la carpeta si quieres que sea distinta
REMOTE=Google-drive #CAMBIA google-drive POR EL NOMBRE QUE PUSISTE EN EL PASO 1


#NO EDITAR NI TOCAR
BACKUPDIR=`date +%Y` #ES PARA QUE CREE CARPETA POR A�O
DIR=$CARPETA/$BACKUPDIR/ #ES PARA QUE CREE CARPETA POR NOMBRE_DE_CARPETA/A�O/
NOMBRE=/tmp/backups-`date +%d-%m-%Y`.tar.gz
tar -zcvf $NOMBRE $EMUDIR
/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$NOMBRE" "$REMOTE:$DIR"
rm $NOMBRE

