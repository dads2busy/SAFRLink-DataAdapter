#!/bin/bash
# This Linux script can be used to start the DataAdapter on a Linux machine.
#
# NOTE:
#   1. Change the first 3 properties (logfile and ports) for your environment.
#   2. The logfile property should be left without an extension.  It will get an extension of ".log" applied automatically.
#   3. If Editing on a Windows box, make sure you use a program which can save Unix Line Endings.
#      such as Notepad++  (http://www.notepad-plus-plus.org/) 

/usr/bin/java -Dedu.vt.ipg.dataadapter.logfile="/tmp/DataAdapterLogs/DataAdapter" -Dedu.vt.ipg.dataadapter.website.portnum=8090 -Dedu.vt.ipg.dataadapter.webservices.portnum=8443 -Dedu.vt.ipg.dataadapter.runfrom=cmdline -Dedu.vt.ipg.dataadapter.clientcert=false -cp ./WEB-INF/lib/*:./WEB-INF/classes edu.vt.ipg.dataadapter.App
