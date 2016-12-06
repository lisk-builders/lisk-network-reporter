Lisk Network Reporter
============
This is the backend service which runs along with Lisk and tracks the network status, fetches information through api and connects through WebSockets to [lisk-network-stats](https://github.com/karek314/lisk-network-stats) to feed information.

## Prerequisite
* lisk up and running
* node
* npm

## Installation
<pre>git clone https://github.com/karek314/lisk-network-reporter/
cd lisk-network-reporter
bash build.sh
</pre>

## Configuration
<pre>nano app.json</pre>
And modify

<pre>
[
  {
    "name"              : "lisk-network-reporter",
    "script"            : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"        : false,
    "watch"             : false,
    "max_restarts"      : 10,
    "exec_interpreter"  : "node",
    "exec_mode"         : "fork_mode",
    "env":
    {
      "NODE_ENV"        : "production",
      "RPC_HOST"        : "localhost",
      "RPC_PORT"        : "8000", <- 8000 for mainnet, 7000 testnet
      "LISTENING_PORT"  : "8000", <- 8000 for mainnet, 7000 testnet
      "INSTANCE_NAME"   : "PICK_INSTANCE_NAME", <- pick your name
      "CONTACT_DETAILS" : "", <- contact details, email or nick on lisk.chat to contact in case any failure
      "NETWORK_MODE"    : "main",
      "WS_SERVER"       : "ws://liskstats.net:3000",
      "WS_SECRET"       : "Go to https://lisk.chat and ask around",
      "IS_FORGING"      : "no", <- Currently there is no simple endpoint to check if any delegate is forging on this node, set "yes" if you are actually forging (in top 101 and actually processing blocks, not standby)
      "VERBOSITY"       : 2
    }
  }
]
</pre>

## Run
Starting
<pre>
pm2 start app.json
</pre>

Checking logs
<pre>
pm2 logs lisk-network-reporter
</pre>

Stopping
<pre>
pm2 stop lisk-network-reporter
</pre>


## Credits
Thanks to [cuberdo](https://github.com/cubedro/) and his [eth-net-intelligence-api](https://github.com/cubedro/eth-net-intelligence-api). This software has been created on the top of his work.
