#!/bin/bash
sed -i -e "s/\"RPC_HOST\"        : \"localhost\"/\"RPC_HOST\"        : \"$LISK_HOST\"/g" app.json
sed -i -e "s/\"RPC_PORT\"        : \"8000\"/\"RPC_PORT\"        : \"${LISK_PORT:-8000}\"/g" app.json
sed -i -e "s/\"LISTENING_PORT\"  : \"8000\"/\"LISTENING_PORT\"  : \"${LISK_PORT:-8000}\"/g" app.json
sed -i -e "s/PICK_INSTANCE_NAME/$LISK_ADDRESS/g" app.json
sed -i -e "s/\"CONTACT_DETAILS\" : \"\",/\"CONTACT_DETAILS\" : \"$LISK_CONTACT\"/g" app.json
sed -i -e "s/Go to https:\/\/lisk.chat and ask around/$LISKSTATS_SECRET/g" app.json
sed -i -e "s/\"IS_FORGING\"      : \"no\"/\"IS_FORGING\"      : \"${LISK_ISFORGING:-no}\"/g" app.json
git pull
npm install
node app.js
