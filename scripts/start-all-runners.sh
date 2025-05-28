#!/bin/bash

# Problem: the private server will be used as self-hosted runner
# So I create a ~/runners/ on the server to place all those runners for multiple projects
# and I write this script to quickly check (if not running) and start all of them

# Function to check if a runner is already running
is_runner_running() {
    local runner_dir="$1"
    local runner_name=$(basename "$runner_dir")

    # Check for both the helper script and the Runner.Listener process
    local helper_count=$(ps aux | grep -v grep | grep "$runner_dir/run-helper.sh" | wc -l)
    local listener_count=$(ps aux | grep -v grep | grep "$runner_dir/bin/Runner.Listener" | wc -l)

    # If either process is running, consider the runner as active
    if [ "$helper_count" -gt 0 ] || [ "$listener_count" -gt 0 ]; then
        return 0  # Running
    else
        return 1  # Not running
    fi
}

# Function to start a runner
start_runner() {
    local script_path="$1"
    local runner_dir=$(dirname "$script_path")
    local runner_name=$(basename "$runner_dir")

    echo "Starting runner: $runner_name"
    cd "$runner_dir"
    nohup ./run.sh &> runner.log &
    echo "  → Started with PID $!"
}

# Main execution
echo "Checking and starting GitHub Actions runners..."
echo "=============================================="

# Store the original directory
ORIGINAL_DIR=$(pwd)

# Find all run.sh scripts at maxdepth 2 and process them
while IFS= read -r -d '' script_path; do
    runner_dir=$(dirname "$script_path")
    runner_name=$(basename "$runner_dir")

    echo
    echo "Checking runner: $runner_name"
    echo "  Path: $script_path"

    if is_runner_running "$runner_dir"; then
        echo "  Status: Already running - SKIPPED"
    else
        echo "  Status: Not running - STARTING"
        start_runner "$script_path"
    fi

    # Return to original directory after each runner
    cd "$ORIGINAL_DIR"
done < <(find . -maxdepth 2 -name "run.sh" -type f -print0)

echo
echo "=============================================="
echo "Runner startup check completed!"
echo
echo "Current runner processes:"
ps aux | grep -E "(run-helper\.sh|Runner\.Listener)" | grep -v grep
