#!/usr/bin/env bash
tail -1 /home/delwin/logs/tt.log | grep --only-matching "http.*://.*" | cut -d ' ' -f 1 | cut -d "'" -f 1 >> /home/delwin/logs/tturl.log
