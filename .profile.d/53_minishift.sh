#!/bin/bash

export MINISHIFT_PATH="/opt/minishift"
export PATH="$MINISHIFT_PATH:$PATH"


(
#$MINISHIFT_PATH/minishift start || true
#export MINISHIFT_OC_ENV=$($MINISHIFT_PATH/minishift oc-env || true)
#if [[ "$MINISHIFT_OC_ENV" == *"PATH"* ]]; then
#		eval $MINISHIFT_OC_ENV
#fi
export PATH="/home/jag/.minishift/cache/oc/v3.11.0/linux:$PATH"
) &
