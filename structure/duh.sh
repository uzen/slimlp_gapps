#!/sbin/sh

# STATUS for use in edify (9=gapps don't exist)
STATUS=0

# functions
special_status() {
    STATUS=${1}
}

# get file descriptor for output
OUTFD=$(ps | grep -v grep | grep -oE "update-binary(.*)" | cut -d " " -f 3)

ui_print() {
    if [ "$OUTFD" != "" ]; then
        echo "ui_print ${1} " 1>&$OUTFD;
        echo "ui_print " 1>&$OUTFD;
    else
        echo "${1}";
    fi;
}

if [ -e /system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk -a -e /system/priv-app/GoogleLoginService/GoogleLoginService.apk ]
then
    # gapps are installed
    ui_print "yay! gapps are installed - continuing add-on installation..."
else
    special_status 9
fi

echo "ro.addon.install.status=$STATUS" > /tmp/build.prop