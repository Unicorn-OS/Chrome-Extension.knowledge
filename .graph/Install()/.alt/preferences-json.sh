#!/usr/bin/bash

# install extensions via terminal

# fill the array with the needed extensions 
# key=["extension_name"] value="extension_ID"

declare -A EXTlist=(
    ["google-translate"]="aapbdbdomjkkjkaonfhkkikfgjllcleb"
    ["save-to-google-drive"]="gmbmikajjgmnabiglmofipeabaddhgne"
)
for i in "${!EXTlist[@]}"; do
    # echo "Key: $i value: ${EXTlist[$i]}"
    echo '{"external_update_url": "https://clients2.google.com/service/update2/crx"}' > /opt/google/chrome/extensions/${EXTlist[$i]}.json
done

