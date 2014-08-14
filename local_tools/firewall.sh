# Run on local osx machine to set up firewall for debugging mapreduce jobs via HTTP.
gcutil addfirewall logs_worker --network=default --allowed=tcp:8042
gcutil addfirewall logs_master --network=default --allowed=tcp:8088
