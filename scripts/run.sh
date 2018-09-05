#!/usr/bin/env bash
PATH='/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/opt/puppetlabs/bin'

vagrant up --parallel

sleep 5

for i in `echo "10.11.11.10 10.11.11.20 10.11.11.30"`; do
  echo "Test ${i}, command 'curl -i http://${i}':"
  curl -i http://$i
done


