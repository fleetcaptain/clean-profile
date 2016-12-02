# this script clears cache from user profiles on a remote computer
# the default hidden C$ share must be enabled on the remote computer for this to work
# since UNC paths are used the credentials of the user running this script are used to connect (presumably IT)
# so if you are not authorized to connect to the remote computer this won't work

$pc = $args[0]
$usern = $args[1]
$ErrorActionPreference = "SilentlyContinue"
$users = @()
echo "If the files are open by the user, this script will not be able to clear them"

$path = "\\" + $pc + "\c$\Users"

if ($usern -like "all") {
	$users = get-childitem -name $path
} else {
	$users += $usern
}



foreach ($username in $users) {

echo ""
echo "-------------"
echo $username


$appdata = "\\" + $pc + "\c$\Users\" + $username + "\AppData\"






# Locations to clear


#
# *** Google Chrome ***
#
$chrome_cache = $appdata + "Local\Google\Chrome\User Data\Default\Cache\*"
$chrome_mediacache = $appdata + "Local\Google\Chrome\User Data\Default\Media Cache\*"

#
# *** Google Earth ***
#
$earth_cache = $appdata + "LocalLow\Google\GoogleEarth\unified_cache_leveldb_leveldb2\*"
$earth_webdata = $appdata + "LocalLow\Google\GoogleEarth\webdata\*"

#
# *** Internet Explorer and Windows ***
#
$ms_terminal_server_cache = $appdata + "Local\Microsoft\Terminal Server Client\Cache\*"
$ms_windows_webcache = $appdata + "Local\Microsoft\Windows\WebCache\*"
$ie_cache = $appdata + "Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\*" #needs to be recursive
$ie_cache2 = $appdata + "Local\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\*" #needs to be recursive
$crashdumps = $appdata + "Local\CrashDumps\*"
$media_player = $appdata + "Local\Microsoft\Media Player\*"

#
# *** Microsoft Office ***
#
$outlook_pst = $appdata + "Local\Microsoft\Outlook\*.pst"
$outlook_ost = $appdata + "Local\Microsoft\Outlook\*.ost"
$outlook_inet_cache = $appdata + "Local\Microsoft\Windows\Temporary Internet Files\Content.Outlook\*" #recursive
$office_cache = $appdata + "Local\Microsoft\Windows\Temporary Internet Files\Content.MSO\*" #recursive
$word_cache = $appdata + "Local\Microsoft\Windows\Temporary Internet Files\Content.Word\*" #recursive

#
# *** Local\Temp directory ***
#
$temp = $appdata + "Local\Temp\*" #recursive

#
# *** Adobe ***
#
$adobe = $appdata + "Local\Adobe\*" #recursive

#
# *** Citrix GoToMeeting ***
#
$citrix_meeting = $appdata + "Local\Citrix\GoToMeeting\*" #recurse







# actual clearing commands

echo "Clearing Google Chrome cache..."
remove-item $chrome_cache
remove-item $chrome_mediacache

echo "Clearing Google Earth cache..."
remove-item $earth_cache
remove-item $earth_webdata

echo "Clearing misc Microsoft stuff..."
remove-item $ms_terminal_server_cache
remove-item $crashdumps
#remove-item $media_player

echo "Clearing IE web cache..."
remove-item $ms_windows_webcache -recurse
remove-item $ie_cache -recurse
remove-item $ie_cache2 -recurse

echo "Clearing Outlook & MS Office caches..."
remove-item $outlook_pst
remove-item $outlook_ost
remove-item $outlook_inet_cache -recurse
remove-item $office_cache -recurse
remove-item $word_cache -recurse

echo "Clearing Adobe..."
remove-item $adobe -recurse

echo "Clearing Citrix GoToMeeting..."
remove-item $citrix_meeting -recurse

echo "Clearing temp folder..."
remove-item $temp -recurse




echo "Operations complete."
echo "Note: if you want to clear the Firefox cache you must do so manually, as this script has not yet implemented Firefox cleaning"
