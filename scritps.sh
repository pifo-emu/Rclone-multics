#!/bin/bash
#ESTO PUEDES EDITAR
EMUDIR= /tu_ruta/ #Edita la ruta de tu configuracion
CARPETA=Emuladora #Edita el nombre de la carpeta si quieres que sea distinta
REMOTE=google-drive #CAMBIA google-drive POR EL NOMBRE QUE PUSISTE EN EL PASO 1

#NO EDITAR NI TOCAR
BACKUPDIR=`date +%Y/%m/%d` #ES PARA QUE CREE CARPETA POR AÑO/MES/DIA
DIR=$CARPETA/$BACKUPDIR/ #ES PARA QUE CREE CARPETA POR NOMBRE_DE_CARPETA/AÑO/MES/DIA/
/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$EMUDIR" "$REMOTE:$DIR"

