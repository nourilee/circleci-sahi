#!/bin/bash

# This shell script should be used only if you are running it on the Master machine.

if [ $# -lt 3 ] 
then
echo "Usage: drun.sh <sah file|suite file> <startURL> <browserType> <tags>"
echo "File path is relative to userdata/scripts"
echo "Multiple browsers can be specified using +. Eg. ie+firefox"
echo "Modes are available in Sahi Pro Desktop Add-on only."
echo "START_MODE can be : WINDOWS, JAVA, JAVA_APPLET"
echo "tags are used only if the input file is a .csv file, .s.csv file or a .dd.csv file"
echo "For JAVA mode startURL can be passed as \" \" and browserType can be passed as \"none;java\""
echo "--"
echo "Example:" 
echo "$0 demo/demo.suite http://sahitest.com/demo/ firefox"
echo "$0 demo/sahi_demo.sah http://sahitest.com/demo/ firefox"
echo "$0 demo/sahi_demo.sah http://sahitest.com/demo/ firefox+safari"
echo "$0 demo/testcases/testcases_sample.csv http://sahitest.com/demo/ firefox \"(admin||user)&&medium\""
echo "$0 demo/ddcsv/test.dd.csv http://sahitest.com/demo/ firefox \"(admin||user)&&medium\""
echo "$0 demo/framework/sample.xls http://sahitest.com/demo/training/ firefox"
echo "$0 demo/framework/scenario_new.s.csv http://sahitest.com/demo/training/ firefox \"all\""
echo "$0 script_name.sah \" \" \"none;java\""
echo "--"
else

export SAHI_HOME=../..
. ./setjava.sh

# REM SOURCE_SCRIPTS_PATH should be relative to the userdata folder OR it should be an absolute path. It contains ALL the scripts that are to be run.
export SOURCE_SCRIPTS_PATH=scripts/

# START_URL refers to the start url against which the suite will be run. This is to be passed as the 2nd parameter to drun.
export START_URL=$2

# Scripts will be distributed across all the nodes. The nodes may or may not include the Master machine, i.e. localhost
# SET NODES=localhost:9999,othermachine:9999,thirdmachine:9999
export NODES=localhost:9999

export NODES_FILEPATH=

export BROWSERDEVICEPARAMS=$3

# Set SEND_EMAIL_REPORT to true if email is to be sent at the end of a run
export SEND_EMAIL_REPORT=false
# EMAIL_TRIGGER indicates the trigger when email should be sent. Possible values are success OR failure OR success,failure
export EMAIL_TRIGGER=success,failure

# Set SEND_EMAIL_REPORT_PERIODICALLY to true if email is to be sent after particular interval of time
export SEND_EMAIL_REPORT_PERIODICALLY=
# Set SEND_EMAIL_REPORT_PERIODICALLY_TIME indicates time(minutes) interval after which email will be sent.
export SEND_EMAIL_REPORT_PERIODICALLY_TIME=

# email.properties contains the details needed for sending the email
export EMAIL_PROPERTIES=../config/email.properties
# Set EMAIL_PASSWORD_HIDDEN to true to prevent the password from getting logged
export EMAIL_PASSWORD_HIDDEN=true

# Uncomment the following line to set custom fields. Replace the custom field keys and values as appropriate
#export CUSTOM_FIELDS="-customField custom Value -anotherCustomField another value"

# Uncomment the following line to set the userDefinedId. Replace the value as appropriate. The key should remain as userDefinedId
#export USER_DEFINED_ID="-userDefinedId  Some Id"

# LOGS_INFO format is type:filePath,type2,type3:filePath3
# export LOGS_INFO=html:D:/html,xml
export LOGS_INFO=html

export THREADS=1

# SHOW_PERIODIC_SUMMARY enables printing of script status update in the console
export SHOW_PERIODIC_SUMMARY=true

java -cp $SAHI_HOME/lib/ant-sahi.jar in.co.sahi.distributed.DSahiRunner -scriptsPathMaster $SOURCE_SCRIPTS_PATH -ignorePattern ".*(svn|copied).*" $CUSTOM_FIELDS $USER_DEFINED_ID -suite $1 -browserDeviceParams "$BROWSERDEVICEPARAMS" -logsInfo "$LOGS_INFO" -baseURL $START_URL -host localhost -port 9999 -threads "$THREADS" -nodes "$NODES" -nodesFilePath "$NODES_FILEPATH" -sendEmail $SEND_EMAIL_REPORT -emailTrigger "$EMAIL_TRIGGER" -emailProperties "$EMAIL_PROPERTIES" -sendEmailPeriodically "$SEND_EMAIL_REPORT_PERIODICALLY" -sendEmailPeriodicallyTime "$SEND_EMAIL_REPORT_PERIODICALLY_TIME" -emailPasswordHidden "$EMAIL_PASSWORD_HIDDEN" -showPeriodicSummary "$SHOW_PERIODIC_SUMMARY" -tags $4
fi
