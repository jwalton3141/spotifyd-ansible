#! /bin/bash

is_encoding_utf8 () { locale charmap 2>/dev/null | grep -qi "utf-\+8"; }

if ! command -v ansible &> /dev/null
then
  echo Ansible not installed. Installing...
  sudo apt update && sudo apt install -y ansible
fi

if ! is_encoding_utf8
then
  echo Ansible requires the locale encoding to be UTF-8...
  echo Setting LC_ALL=C.UTF-8 to attempt temporary resolution...
  export LC_ALL=C.UTF-8

  if ! is_encoding_utf8
  then
    echo Attempted resolution ineffective. Please resolve encoding manually...
    exit 1
  else
    echo Encoding set correctly! Continuing...
  fi
fi

ansible-playbook -i hosts main.yml
