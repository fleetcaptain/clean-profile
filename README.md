# clean-profile
Powershell script to clear common Windows user profile caches

This Powershell script connects to a remote computer through the c$ share and deletes cached data from common applications and locations. Current items include Chrome, Google Earth, InternetExplorer, GoToMeeting, and Office. It was created to assist with upkeep of my organization's virtual desktop infrastructure where computers had very limited space for user-specific data and large user cache could cause problems. It works in any environment, feel free to use as needed! It's also handy to reduce the size of a user's profile before transferring it to a new computer (like with Windows Easy Transfer).

To run the script:

PS > clean-profile.ps1 -computername or IP- -username or keyword all-

The username should be the user's Windows login name and depends on your organization's naming convention. If the convention is first letter of first name + last name, then user John Doe's username would be jdoe. If the keyword 'all' is used in place of the username, then all profiles will be cleaned.

Examples:

PS > clean-profile.ps1 user-pc-34 jdoe //clean user jdoe's profile on user-pc-34

PS > clean-profile.ps1 192.168.1.45 all //clean every user profile on computer 192.168.1.45
