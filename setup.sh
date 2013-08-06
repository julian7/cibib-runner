#!/bin/bash

cd ${0%/*}

cat > AppletLocal.html <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" style="overflow: hidden">
<head>
<title> CIB Internet Bank </title>
</head>
<body style="overflow: hidden;margin: 0px">

<applet name="mainApplet" code="ebank.applet.MainApplet" width="800" height="600" mayscript archive="cibib.jar">
<param name="CABBASE" value="https://cibib.cab">
<param name="default_fontsize" value="11">
<param name="PACKED" value="TRUE">
<param name="java_arguments" value="-Dsun.java2d.noddraw=true -Dsun.java2d.d3d=false">
<param name="separate_jvm" value="true">
<param name="centerimage" value="true">
<param name="boxborder" value="false">
<param name="image" value="loader_hu.gif">
<param name="MAYSCRIPT" value="true">
<param name="BASEVIEW" value="1">
<param name="LOGLEVEL" value="50">
<param name="PROTOCOL" value="https">
<param name="SERVERURL" value="https://ibank.cib.hu/IBWBGateway/IBGatewayServlet">
<param name="PRINTERURL" value="https://ibank.cib.hu/IBWBGateway/IBPrintingServlet">
<param name="LANGUAGE" value="hu">
<param name="INITWIDTH" value="800">
<param name="INITHEIGHT" value="600">
</applet>

<!-- <param name="DEMOMODE" value="TRUE"> -->

	<script>

window.onerror = myErrorHandler;

function help(pageName)
{
	help_window = window.open(pageName, "help", "toolbar=0,location=0,resizable=0,status=0,menubar=0,scrollbars=0,hotkeys=1,fullscreen=0,width=500,height=380,marginheight=0,marginwidth=0,dependent=1");
	help_window.focus();
}

function printWindow(text)
{
	msgWindow=window.open("","_blank", "toolbar=1,location=0,resizable=1,status=1,menubar=1,scrollbars=1,fullscreen=0");
	msgWindow.document.open("text/html", "replace");
	msgWindow.document.write(text);
	msgWindow.document.close();
}

function saveWindow(text)
{
	msgWindow=window.open("","_blank", "toolbar=1,location=0,resizable=1,status=1,menubar=1,scrollbars=1,fullscreen=0");
	msgWindow.document.open("text/plain", "replace");
	msgWindow.document.write(text);
	msgWindow.document.close();
}

function myErrorHandler(msg, url, linenumber)
{
	alert(msg + ' at line: ' + linenumber);
	return true;
}

	</script>
</body>
</html>
EOF

echo 'grant { permission java.security.AllPermission; };' > cibib.policy
