#!/bin/bash
OMALERT='/opt/dell/srvadmin/bin/omconfig system alertaction'
EXECAPPATH=/usr/local/sbin/dasan_alert_omsa.sh

$OMALERT event=intrusion              execappath=$EXECAPPATH
$OMALERT event=systempeakpower        execappath=$EXECAPPATH
$OMALERT event=watchdogasr            execappath=$EXECAPPATH

$OMALERT event=tempfail               execappath=$EXECAPPATH
$OMALERT event=tempwarn               execappath=$EXECAPPATH

$OMALERT event=fanfail                execappath=$EXECAPPATH
$OMALERT event=fanwarn                execappath=$EXECAPPATH

$OMALERT event=batteryfail            execappath=$EXECAPPATH
$OMALERT event=batterywarn            execappath=$EXECAPPATH

$OMALERT event=processorfail          execappath=$EXECAPPATH
$OMALERT event=processorwarn          execappath=$EXECAPPATH
$OMALERT event=memprefail             execappath=$EXECAPPATH
$OMALERT event=memfail                execappath=$EXECAPPATH

$OMALERT event=powersupply            execappath=$EXECAPPATH
$OMALERT event=powersupplywarn        execappath=$EXECAPPATH
$OMALERT event=systempowerfail        execappath=$EXECAPPATH
$OMALERT event=systempowerwarn        execappath=$EXECAPPATH
$OMALERT event=voltfail               execappath=$EXECAPPATH
$OMALERT event=voltwarn               execappath=$EXECAPPATH

$OMALERT event=storagesysfail         execappath=$EXECAPPATH
$OMALERT event=storagectrlfail        execappath=$EXECAPPATH
$OMALERT event=storagesyswarn         execappath=$EXECAPPATH
$OMALERT event=storagectrlwarn        execappath=$EXECAPPATH
$OMALERT event=storagectrlbatterywarn  execappath=$EXECAPPATH
$OMALERT event=storagectrlbatteryfail  execappath=$EXECAPPATH

$OMALERT event=pdiskwarn              execappath=$EXECAPPATH
$OMALERT event=pdiskfail              execappath=$EXECAPPATH
$OMALERT event=vdiskwarn              execappath=$EXECAPPATH
$OMALERT event=vdiskfail              execappath=$EXECAPPATH
$OMALERT event=enclosurewarn          execappath=$EXECAPPATH
$OMALERT event=enclosurefail          execappath=$EXECAPPATH

$OMALERT event=redundegrad            execappath=$EXECAPPATH
$OMALERT event=redunlost              execappath=$EXECAPPATH

$OMALERT event=hardwarelogwarn        execappath=$EXECAPPATH
$OMALERT event=hardwarelogfull        execappath=$EXECAPPATH

$OMALERT event=removableflashmediapresent    execappath=$EXECAPPATH
$OMALERT event=removableflashmediaremoved    execappath=$EXECAPPATH
$OMALERT event=removableflashmediafail       execappath=$EXECAPPATH

# END of File.
