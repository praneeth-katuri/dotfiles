#!/bin/bash

# Wait for DBus and kwalletd6 to be ready
sleep 2

# Open the wallet using qdbus6
qdbus6 org.kde.kwalletd6 /modules/kwalletd6 org.kde.KWallet.open kdewallet 0 "sway-session"
