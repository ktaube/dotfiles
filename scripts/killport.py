#!/usr/bin/env python3
import subprocess
import sys

def killport(port):
    # Get the list of PIDs using the given port
    try:
        result = subprocess.run(['lsof', '-ti', f'tcp:{port}'], stdout=subprocess.PIPE)
        pids = result.stdout.decode('utf-8').strip().split('\n')

        print(f"Killing processes listening on port {port}")
        
        if not pids or pids[0] == '':
            print(f"No process found listening on port {port}")
            return

        # Kill each PID
        for pid in pids:
            subprocess.run(['kill', '-9', pid])
            print(f"Killed process {pid} listening on port {port}")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python killport.py [port]")
        sys.exit(1)

    port = sys.argv[1]
    killport(port)
