#!/bin/sh

local OPENSSL=$(command -v openssl)

[ -z "$OPENSSL" ] && write_log 14 "Onamae.com communication require openssl. Please install"
[ -z "$domain" ] && write_log 14 "Service section not configured correctly! Missing 'domain'"
[ -z "$username" ] && write_log 14 "Service section not configured correctly! Missing 'username'"
[ -z "$password" ] && write_log 14 "Service section not configured correctly! Missing 'password'"

local __HOST=$(printf %s "$domain" | cut -d@ -f1)
local __DOMAIN=$(printf %s "$domain" | cut -d@ -f2)

local __MSG="LOGIN
USERID:$username
PASSWORD:$password
.
MODIP"
if [ -n "$__HOST" ]; then
	__MSG="$__MSG
	HOSTNAME:$__HOST"
fi
__MSG="$__MSG
DOMNAME:$__DOMAIN
IPV4:$__IP
.
LOGOUT
.
"

local __RESULT_MSG=$(printf "%s" "$__MSG" | $OPENSSL s_client -quiet ddnsclient.onamae.com:65010)

local __SUCCESS_MSG="000 COMMAND SUCCESSFUL
.
000 COMMAND SUCCESSFUL
.
000 COMMAND SUCCESSFUL
.
000 COMMAND SUCCESSFUL
."

if [ "$__RESULT_MSG" != "$__SUCCESS_MSG" ]; then
	write_log 14 "Failed to update IP address"
fi

return 0
