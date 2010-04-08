#!/bin/bash

watch "sudo df | grep [509,][0-9]\% | cat -s - | sed 's/^[ \t]*//'"
