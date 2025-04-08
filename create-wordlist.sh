#!/bin/bash

for i in `cat $1`; do echo ${i}; echo ${i}2019; echo ${i}2020; echo ${i}2021; echo ${i}2022; echo ${i}1; echo ${i}123; done >> n
for i in `cat n`; do echo ${i}; echo ${i}'!'; echo ${i}'@'; echo ${i}'#'; echo ${i}'$'; echo ${i}'%'; echo ${i}'^'; echo ${i}'&'; echo ${i}'*'; echo ${i}'?'; done >> s
hashcat s -r /usr/share/hashcat/rules/leetspeak.rule --stdout > hc
wordlister --input s --output w1 --perm 1 --min 4 --max 48 --leet &>/dev/null
cat hc w1 | sort -u > xx
wordlister --input xx --output w2 --perm 1 --min 4 --max 48 --cap --up &>/dev/null
cat w2 | sort -u > $2
rm n s hc w1 xx w2
