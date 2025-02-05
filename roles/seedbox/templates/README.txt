##
##  Download HowTo
## ----------------
##
## To fetch 'FILE' via bittorrent, either use:
##
##   aria2c --dht-entry-point={{ ansible_default_ipv4['address'] }}:{{ dht_port }} \
##                    http://{{ ansible_default_ipv4['address'] }}/aria2/FILE.torrent
##
## or download 'FILE.torrent' and run:
##
##   aria2c --dht-entry-point={{ ansible_default_ipv4['address']}}:{{ dht_port }} FILE.torrent
##
## To disable seeding after download specify '--seed-time=0'.
##
##
##  Upload HowTo
## --------------
##
## Make sure the following packages are installed: aria2 mktorrent.
## Download the uploadseed script and make it executable, then run:
##
##   ./uploadseed --rpc-server {{ ansible_default_ipv4['address'] }}:6800 --dht-port {{ dht_port }} \
##                    --rpc-secret RPC_SECRET --no-cert  UPLOADFILE
##
## Or, more secure, providing the certificate:
##
##   ./uploadseed --rpc-server {{ ansible_default_ipv4['address'] }}:6800 --dht-port {{ dht_port }} \
##                    --rpc-secret RPC_SECRET --cert CERT  UPLOADFILE
##
## ---
## To remove a seed, run 'rmseed FILE' on the seedbox.  This will
## remove 'FILE' and 'FILE.torrent' permanently and restart seeding.
##
