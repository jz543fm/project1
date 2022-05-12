#!/bin/bash

gawk -F: '{print $1}' /etc/passwd
