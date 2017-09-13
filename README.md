# clean-profile
Powershell script to clear common Windows user profile caches

This script connects to a remote computer through the c$ share and deletes cached data from common applications and locations. Current items include Chrome, Google Earth, InternetExplorer, GoToMeeting, and Office. It was created to assist with upkeep of virtual desktop infrastructure where computers had very limited space for user-specific data and a large user cache could cause problems. It's also useful to reduce the size of a user's profile before transferring the profike to a new computer like with Windows Easy Transfer.

To run the script:

PS > clean-profile.ps1 -computername or IP- -username or keyword all-

The username should match the user's profile folder in C:\Users\. If the keyword 'all' is used in place of the username, then all profiles under C:\Users\ will be cleaned.

Examples:

PS > clean-profile.ps1 user-pc-34 jdoe //clean user jdoe's profile on user-pc-34

PS > clean-profile.ps1 192.168.1.45 all //clean every user profile on computer 192.168.1.45
