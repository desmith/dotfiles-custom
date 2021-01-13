# virtualenv functions -- events replace virtualenv hooks
function postactivate --on-event virtualenv_did_activate
    echo "Activating" (basename $VIRTUAL_ENV) "venv..."
    set PROJECT_PATH (cat $VIRTUAL_ENV/.project)
    cd $PROJECT_PATH
end

function postactivate-dhamseva --on-event virtualenv_did_activate:dhamseva
    #set -gx AWS_DEFAULT_PROFILE desmith-s4d
    #echo AWS_DEFAULT_PROFILE: $AWS_DEFAULT_PROFILE
    set -gx DJANGO_SETTINGS_MODULE config.settings.local
    echo DJANGO_SETTINGS_MODULE: $DJANGO_SETTINGS_MODULE
end

function postactivate-mgsanga --on-event virtualenv_did_activate:mgsanga
    set -gx AWS_DEFAULT_PROFILE django-mgsanga
    echo AWS_DEFAULT_PROFILE: $AWS_DEFAULT_PROFILE
    set -gx DJANGO_SETTINGS_MODULE config.settings
    echo DJANGO_SETTINGS_MODULE: $DJANGO_SETTINGS_MODULE
end

function postactivate-st --on-event virtualenv_did_activate:st
    ssh-add ~/.ssh/seizuretracker/codecommit-st-APK6OJ
    set -gx AWS_PROFILE dsmith-st
    echo AWS_PROFILE: $AWS_PROFILE
end

function postactivate-st2020 --on-event virtualenv_did_activate:st2020
    ssh-add ~/.ssh/st-2020/codecommit-st-APKEMK
    set -gx AWS_PROFILE dsmith-st2020
    echo AWS_PROFILE: $AWS_PROFILE
end

function postactivate-sviz --on-event virtualenv_did_activate:sviz
    ssh-add ~/.ssh/sviz/codecommit-sviz-APKWNJ
    set -gx AWS_PROFILE dsmith-sviz
    echo AWS_PROFILE: $AWS_PROFILE
end

function postactivate-inews --on-event virtualenv_did_activate:inews
    set -gx AWS_PROFILE django-iskconnews
    set -gx AWS_DEFAULT_PROFILE django-iskconnews
    ssh-add ~/.ssh/icg/codecommit_rsa
    echo AWS_PROFILE: $AWS_PROFILE
    echo AWS_DEFAULT_PROFILE: $AWS_DEFAULT_PROFILE
    set -gx DJANGO_SETTINGS_MODULE config.settings
    echo DJANGO_SETTINGS_MODULE: $DJANGO_SETTINGS_MODULE
end

function postactivate-imedia --on-event virtualenv_did_activate:imedia
    set -gx AWS_PROFILE django-imedia
    set -gx AWS_DEFAULT_PROFILE django-imedia
    ssh-add ~/.ssh/icg/codecommit_rsa
    echo AWS_PROFILE: $AWS_PROFILE
    echo AWS_DEFAULT_PROFILE: $AWS_DEFAULT_PROFILE
    set -gx DJANGO_SETTINGS_MODULE config.settings
    echo DJANGO_SETTINGS_MODULE: $DJANGO_SETTINGS_MODULE
end

function postdeactivate --on-event virtualenv_did_deactivate
    set --erase AWS_PROFILE
    set --erase AWS_DEFAULT_PROFILE
    set --erase DJANGO_SETTINGS_MODULE
    echo "DEactivating" (basename $VIRTUAL_ENV) "venv..."
    builtin cd $argv
end

############################
#The full list of events is:
#
#virtualenv_did_setup_plugins
#virtualenv_will_activate
#virtualenv_will_activate:<env name>
#virtualenv_did_activate
#virtualenv_did_activate:<env name>
#virtualenv_will_deactivate
#virtualenv_will_deactivate:<env name>
#virtualenv_did_deactivate
#virtualenv_did_deactivate:<env name>
#virtualenv_will_create
#virtualenv_did_create
#virtualenv_did_create:<env name>
############################
