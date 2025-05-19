#!/bin/bash

# Problem: the private server will be used as self-hosted runner itself
# So I create a ~/runners/ on the server to place all those runners for multiple projects
# and I write this script to  quickly check (if not running) and start all of them

for dir in */; do
  runscript="./$dir/run.sh"
  [[ -x "$runscript" ]] || continue

  if ! pgrep -f "$dir/bin/Runner.Listener run" > /dev/null; then
    echo "Starting runner in $dir"
    (cd "$dir" && nohup ./run.sh &> runner.log &)
  else
    echo "Runner in $dir already running"
  fi
done
