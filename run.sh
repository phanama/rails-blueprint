#!/usr/bin/env bash

service postgresql start && \
sleep 5 && \
rails server
