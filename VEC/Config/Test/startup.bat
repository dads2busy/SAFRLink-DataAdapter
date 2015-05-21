REM This Windows batch file can be used to start the DataAdapter on a Windows Machine.
REM 
REM NOTE:
REM   1. Change the first 3 properties (logfile and ports) for your environment.
REM   2. The logfile property should be left without an extension.  It will get an extension of ".log" applied automatically.

set LIBDIR=WEB-INF\lib
set CLASSPATH=%LIBDIR%\*;

java -version:"1.7" -Dedu.vt.ipg.dataadapter.logfile="C:\VLDS_DataAdapter_Logs\VECDataAdapter" -Dedu.vt.ipg.dataadapter.website.portnum=9090 -Dedu.vt.ipg.dataadapter.webservices.portnum=9443 -Dedu.vt.ipg.dataadapter.runfrom=cmdline -Dedu.vt.ipg.dataadapter.clientcert=false -cp WEB-INF\lib\*;WEB-INF\classes edu.vt.ipg.dataadapter.App