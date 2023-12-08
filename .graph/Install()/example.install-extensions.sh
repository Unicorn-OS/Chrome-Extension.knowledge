#!/bin/bash
# You have to run this with sudo `sudo ./install-extensions.sh`
#prime: https://askubuntu.com/questions/1063331/how-to-install-google-chrome-extensions-though-terminal
#doc: https://developer.chrome.com/docs/extensions/mv3/external_extensions/#preference-linux

chromium="/usr/share/chromium/extensions"
chrome="/usr/share/google-chrome/extensions"
chromium_snap="/home/me/snap/chromium/common/chromium/Default/Extensions"
brave="/opt/brave.com/brave/extensions"

make_ext_dir(){
  mkdir -p $this_browser
}

install_chrome_extension () {
  preferences_dir_path="${this_browser}"
  pref_file_path="$preferences_dir_path/$1.json"
  upd_url="https://clients2.google.com/service/update2/crx"
  mkdir -p "$preferences_dir_path"
  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"
  echo Added \""$pref_file_path"\" ["$2"]
}

test_ext(){
  install_chrome_extension "fmkadmapgofadopljbjfkapdkoienihi" "react dev tools"
  install_chrome_extension "anmidgajdonkgmmilbccfefkfieajakd" "save pinned tabs"
  install_chrome_extension "dbepggeogbaibhgnhhndojpepiihcmeb" "vimium"
}

my_extensions(){
  make_ext_dir
  install_chrome_extension "nmidkjogcjnnlfimjcedenagjfacpobb" "freststart"
  install_chrome_extension "nngceckbapebfimnlniiiahkandclblb" "bitwarden"
  install_chrome_extension "cjpalhdlnbpafiamejdnhcphjbkeiagm" "ublock origin"
  
  #test_ext
}

main(){
  this_browser=$chrome
  my_extensions
  this_browser=$chromium_snap
  my_extensions
  this_browser=$chromium
  my_extensions
  this_browser=$brave
  my_extensions
}

main
