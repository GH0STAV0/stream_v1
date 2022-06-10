#!/bin/bash
# set -x
echo "-------------------------> RESTART SUPERVISOR <-------------------------------------"
supervisorctl restart mega-sync

echo "sleep for 5 seconds "
sleep 5
echo "sleep Done"

echo "-------------------------> END SYCHRONIZNG <-------------------------------------"

