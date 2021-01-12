# virtualenv functions -- events replace virtualenv hooks
function postactivate --on-event virtualenv_did_activate
  echo "Activating" (basename $VIRTUAL_ENV) "venv..."
  set PROJECT_PATH (cat $VIRTUAL_ENV/.project)
  cd $PROJECT_PATH
end

function postactivate-news --on-event virtualenv_did_activate:inews
  set -gx DJANGO_ENV production
  set -gx DJANGO_SETTINGS_MODULE config.settings
  echo DJANGO_ENV = $DJANGO_ENV
  echo DJANGO_SETTINGS_MODULE = $DJANGO_SETTINGS_MODULE
end

function postdeactivate --on-event virtualenv_did_deactivate
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
