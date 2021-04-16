
# for i in /opt/.raids/*.sh; do
# 	mdx="${i%.*}"
# 	mdx="${mdx##*/}"
# 	CHECK="$(mdadm --detail --scan /dev/${mdx} 2> /dev/null)"
# 	if [ ! -z "$CHECK" ]; then
# 		if [[ "$CHECK" == *"INACTIVE-ARRAY /dev/${mdx}"* ]]; then
# 			mdadm --stop /dev/${mdx}

# 		elif [[ "$CHECK" != "ARRAY /dev/${mdx}"* ]]; then
# 			/bin/bash ${i} 2> /dev/null
# 		fi
# 	fi
		

# 	unset i
# done

