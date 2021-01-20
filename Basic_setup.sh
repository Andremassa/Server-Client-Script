#!/bin/bash

# This is a Dumb script to update upgrade and some basic packages :)

clear
echo ""
echo "\t""Ubuntu Server Setup!"
echo ""
echo "\t"$(date "+DATE: %D") "\n""\t"$(date "+TIME: %T")
echo ""
sleep 2

echo "- Let's get serious!"
echo ""
sleep 1
echo ""
echo "Updating everything..."
echo "wait"
apt -y update && apt -y upgrade
