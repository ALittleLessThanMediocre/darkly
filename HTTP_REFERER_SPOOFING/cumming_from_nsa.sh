#!/usr/bin/bash

IP=192.168.1.221
curl -s -A 'ft_bornToSec' --referer "https://www.nsa.gov/" "http://$IP/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c" | grep 'flag'
