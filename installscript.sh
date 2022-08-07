#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   installscriptWP.sh 
# Description:   Implementar script de Wrong Password
# Written by:    Guillermo Rodriguez
# Maintenance:   Guillermo Rodriguez
# ------------------------------------------------------------------------ #
# Usage:         
#       $ ./install.sh


function menuprincipal () {
clear
TIME=1
echo " "
echo $0
echo " "
echo "Ingresa la opcion correspondiente!

        1 - Agregar Procesos a SNMP
        2 - Instalar script
	0 - Exit"
echo " "
echo -n "Ingresa option: "
read opcion
case $opcion in
	1)
		function SNMP () {
			ASTERISK=`echo "proc asterisk" >> /etc/snmp/snmpd.conf`
			MYSQL=`echo "proc mysqld" >> /etc/snmp/snmpd.conf`
			HTTP=`echo "proc httpd" >> /etc/snmp/snmpd.conf`
			RESTSNMP=`systemctl restart snmpd`
			echo $ASTERISK
			echo $MYSQL
			echo $HTTP
			echo $RESTSNMP
		}
		SNMP
		echo "Se agregaron los procesos de asterisk, mysql y http a snmp"
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	2)
		function PASO1 () {
			CREADIR=`mkdir -p /var/prtg/scripts && mkdir -p /var/prtg/scriptsxml`
			CLONE=`git clone https://github.com/grodrigueztorres1992/Script--PRTG.git`
			MVSCRIPT=`mv Script--PRTG/revision-log-asterisk.sh /var/prtg/scripts`
			MVSCRIPT1=`mv Script--PRTG/valida-estado-troncal.sh /var/prtg/scriptsxml`
			PERMISOS=`chmod 777 /var/prtg/scripts/revision-log-asterisk.sh && chmod 777 /var/prtg/scriptsxml/valida-estado-troncal.sh`
			BORRAR=`rm -rf Script--PRTG`
			echo $CREARDIR
			echo $CLONE
			echo $MVSCRIPT
			echo $MVSCRIPT1
			echo $PERMISOS
			echo $BORRAR
												
		}
		PASO1
		echo "Script Instalado"
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	0) 
	       echo Saliendo de la instalacion
       	       sleep $TIME
	       exit 0
	       ;;

	*)
		echo Opcion Invalida, Vuelve a intentarlo!
		;;
esac
}
menuprincipal
