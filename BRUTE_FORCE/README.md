## Where to Locate:

If we visit the page http://$IP/index.php/?page=signin we find a simple login. 
When we attempt to enter random input, we can observe the generated string presented in the url as a GET request.

Thus we now know the format the server is expecting input, and we can immitate this with various username / password pairs.

## Exploit:

We will attempt this by filling two text files with 100 common passwords and sending this as a post with the cUrl utility, along with some common usernames, and learning from our previous experiences with cUrl we will filter any return through grep with the string "flag", and because we don't want our loop to continue past this point will will exit the program if we get to this point.

This will take some time but we observe that on the 16th attempt we receive a return that was filtered through grep and we receive our flag = b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2

## Prevention:

- For advanced users who want to protect their accounts from attack, give them the option to allow login only from certain IP addresses.
- Assign unique login URLs to blocks of users so that not all users can access the site from the same URL.
- Use a CAPTCHA to prevent automated attacks
- Instead of completely locking out an account, place it in a lockdown mode with limited capabilities.

Attackers can often circumvent many of these techniques by themselves, but by combining several techniques, you can significantly limit brute-force attacks.

Although brute-force attacks are difficult to stop completely, they are easy to detect because each failed login attempt records an HTTP 401 status code in your Web server logs. It is important to monitor your logfiles for brute-force attacks – in particular, the intermingled 200 statuscodes that mean the attacker found a valid password.