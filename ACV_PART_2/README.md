## Introduction:

This exploit follows from the discovery of the robots.txt file at the address http://$IP/robots.txt
There we found two directories /when and /.hidden

When searching through /.hidden we find a number of links with several README files that seem to be sending us on a treasure hunt
for our next flag. We quickly find that every link contains it's own README file and each link seems to contain subdirectories.

To manually search for the correct README file is unadvised because we are not certain of the total number of README files we must first visit. 

## Exploit:

Instead we can write a simple shell script that will utilise the wget utility to download all the README files it can find at our given address, put them into a directory of our choosing and then we will use the 'find' utility to search for the single instance of the README file that contains digits and return that string, and now having found our string we will discard of our temporary directory and delete it.

After this process is complete we will have a new flag = 99dde1d35d1fdd283924d84e6d9f1d820

## Prevention:

Access control vulnerabilities can generally be prevented by taking a defense-in-depth approach and applying the following principles: 

- Never rely on obfuscation alone for access control.
- Unless a resource is intended to be publicly accessible, deny access by default.
- Wherever possible, use a single application-wide mechanism for enforcing access controls.
- At the code level, make it mandatory for developers to declare the access that is allowed for each resource, and deny access by default. 
- Thoroughly audit and test access controls to ensure they are working as designed.