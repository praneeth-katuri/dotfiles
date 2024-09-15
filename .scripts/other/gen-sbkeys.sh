#!/usr/bin/env bash

echo -n "Enter a Common Name to embed in the keys: "
read -r NAME

openssl req -newkey rsa:4096 -nodes -keyout PK.key -new -x509 -sha256 -days 3650 -subj "/CN=$NAME Platform Key/" -out PK.crt
openssl req -newkey rsa:4096 -nodes -keyout KEK.key -new -x509 -sha256 -days 3650 -subj "/CN=$NAME Key Exchange Key/" -out KEK.crt
openssl req -newkey rsa:4096 -nodes -keyout db.key -new -x509 -sha256 -days 3650 -subj "/CN=$NAME Signature Database key/" -out db.crt
openssl x509 -outform DER -in PK.crt -out PK.cer
openssl x509 -outform DER -in KEK.crt -out KEK.cer
openssl x509 -outform DER -in db.crt -out db.cer

uuidgen --random > GUID.txt

cert-to-efi-sig-list -g "$(< GUID.txt)" PK.crt PK.esl
cert-to-efi-sig-list -g "$(< GUID.txt)" KEK.crt KEK.esl
cert-to-efi-sig-list -g "$(< GUID.txt)" db.crt db.esl

sign-efi-sig-list -g "$(< GUID.txt)" -k PK.key -c PK.crt PK PK.esl PK.auth
sign-efi-sig-list -g "$(< GUID.txt)" -c PK.crt -k PK.key PK /dev/null rm_PK.auth
sign-efi-sig-list -g "$(< GUID.txt)" -k PK.key -c PK.crt KEK KEK.esl KEK.auth
sign-efi-sig-list -g "$(< GUID.txt)" -k KEK.key -c KEK.crt db db.esl db.auth

chmod -- 0600 *.key

echo ""
echo ""
echo "copy the *.auth and *.esl files to a FAT32 Pendrive and enroll keys using KeyTool"
echo ""
echo ""
