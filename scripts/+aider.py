#!/usr/bin/env -S uv run
# /// script
# dependencies = [
#   "anthropic",
# ]
# ///

import os
import subprocess
import json
import sys


def get_anthropic_api_key():
    """
    Get Anthropic API key from environment variable or 1Password.

    Returns:
        str: The Anthropic API key if found, None otherwise.
    """
    # Try to get API key from environment variable
    api_key = os.environ.get("ANTHROPIC_API_KEY")

    if api_key:
        return api_key

    try:
        # Run the op command to get the Anthropic API key
        result = subprocess.run(
            [
                "op",
                "item",
                "get",
                "Anthropic API (ktdev)",
                "--reveal",
                "--format",
                "json",
            ],
            capture_output=True,
            text=True,
            check=True,
        )

        # Parse the JSON output
        item_data = json.loads(result.stdout)

        # Extract the credential field
        for field in item_data.get("fields", []):
            if field.get("label") == "credential":
                api_key = field.get("value")
                break

        if not api_key:
            print("Could not find credential field in 1Password item")
    except subprocess.CalledProcessError as e:
        print(f"Error retrieving API key from 1Password: {e}")
        print(f"stderr: {e.stderr}")
    except json.JSONDecodeError:
        print("Error parsing 1Password output as JSON")
    except Exception as e:
        print(f"Unexpected error retrieving API key from 1Password: {e}")

    if not api_key:
        print(
            "No Anthropic API key found. Please set ANTHROPIC_API_KEY environment variable or configure 1Password access."
        )

    return api_key


def launch_aider(api_key):
    """
    Launch aider CLI with the provided API key.

    Args:
        api_key (str): The Anthropic API key to use with aider

    Returns:
        None: This function does not return if successful as it replaces the current process
    """
    if not api_key:
        print("Cannot launch aider without an API key.")
        sys.exit(1)

    # Construct the command to run aider with the retrieved API key
    aider_cmd = ["aider", "--model", "sonnet", "--api-key", f"anthropic={api_key}"]

    # Add any additional command line arguments passed to this script
    aider_cmd.extend(sys.argv[1:])

    try:
        # Execute aider with the API key and pass control to it
        # Using os.execvp to replace the current process with aider
        os.execvp(aider_cmd[0], aider_cmd)
    except FileNotFoundError:
        print(
            "Error: 'aider' command not found. Please make sure it's installed and in your PATH."
        )
        sys.exit(1)
    except Exception as e:
        print(f"Error launching aider: {e}")
        sys.exit(1)


if __name__ == "__main__":
    api_key = get_anthropic_api_key()
    launch_aider(api_key)
