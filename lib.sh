#  Not executable on its own; meant to be sourced by others

PLIST_PATH=/tmp/ramdisk_watch

h2m_bytes()
{
	sed "s/\([0-9][0-9]*\)\([a-zA-Z]\)/\1 * ( 1024 ^ \2 )/" | \
		tr "bBkKmMgGtTpPeE" "00112233445566" | \
		bc
}

h2m_minutes()
{
	SECONDS="$( sed "s/\([0-9][0-9]*\)\([a-zA-Z]\)/\1 * ( 60 ^ \2 )/" | \
		tr "sSmMhH" "001122" | \
		bc )"
	echo "$(( SECONDS / 60 ))"

}


eo()
{
	echo "Error: $1"
	exit 1
}

decho()
{
	if [ -n "$DPRINT" ] ; then
	       	echo "$@"
	fi
}

# functions to translate plist_id into the plist for watcher and autoclean
watch_plist()
{
	printf "%s/%s_watch.plist" "$PLIST_PATH" "$1"
}

clean_plist()
{
	printf "%s/%s_clean.plist" "$PLIST_PATH" "$1"
}


