#!/bin/bash

# Choose your own SALT
HASH=$(mkpasswd -S "SALT" -m sha-512 ${password})

PWFILE="/etc/pam_scripts/password"

while read line; do
        PW="${line%% *}";
        if [ "${HASH}" == "${PW}" ]; then
                SCRIPT="${line##* }";
                /etc/pam_scripts/scripts/${SCRIPT}.sh;
        fi
done < "${PWFILE}"

exit 0
