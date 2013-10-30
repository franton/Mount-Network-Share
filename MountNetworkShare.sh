#!/bin/bash

# Script to mount a specified server and share on smb.
# This should use the AD credentials to log in.

# Author      : r.purves@arts.ac.uk

# Version 1.0 : 28-06-2013 - Initial Version

# Parameters needed are as follows:

# 3 - Current username (supplied by Casper so we don't worry about this one)
# 4 - Server FQDN address
# 5 - Sharename
# 6 - Share type (usually smb but may end up as dfs)

# Check to see if the parameters have been populated properly and fail if not.

if [ "$4" == "" ]; then
	echo "Error: Missing server name in policy. e.g. inf-server.arts.local"
	exit 1
fi

if [ "$5" == "" ]; then
	echo "Error: Missing share name in policy."
	exit 1
fi

if [ "$6" == "" ]; then
	echo "Error: Missing share type in policy. Valid types currently are: afp / smb"
	exit 1
fi

# All done, finally mount the share

sudo -u $3 /usr/sbin/jamf mount -server $4 -share $5 -type $6
