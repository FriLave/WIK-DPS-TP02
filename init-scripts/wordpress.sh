#!/bin/sh
set -e

echo "Enabling Redis Object Cache for WordPress..."
wp redis enable
echo "Redis Object Cache has been enabled."
