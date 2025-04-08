#!/bin/bash

if [ -z $1 ]
then
        echo 'Usage: password-permutator <word>'
        exit 1
fi

echo ''
echo '[*] generating permutations.....'
echo ''

for i in `echo $1 | tr '[:upper:]' '[:lower:]'`; do echo ${i}; echo ${i}2021; echo ${i}2022; echo ${i}2023; echo ${i}2024; echo ${i}2025; echo ${i}1; echo ${i}2; echo ${i}3; echo ${i}4; echo ${i}5; echo ${i}123; echo ${i}1234; echo ${i}12345; done >> n
for i in `cat n`; do echo ${i}; echo ${i}'!'; echo ${i}'@'; echo ${i}'#'; echo ${i}'$'; echo ${i}'%'; echo ${i}'^'; echo ${i}'&'; echo ${i}'*'; echo ${i}'-'; echo ${i}'_'; echo ${i}'='; echo ${i}'+'; echo ${i}'?'; done >> s
hashcat s -r /usr/share/hashcat/rules/leetspeak.rule --stdout > hc
wordlister --input s --output w1 --perm 1 --min 4 --max 48 --leet &>/dev/null
cat hc w1 | sort -u > xx
wordlister --input xx --output w2 --perm 1 --min 4 --max 48 --cap --up &>/dev/null
cat w2 | sort -u > permutations.txt
rm n s hc w1 xx w2
