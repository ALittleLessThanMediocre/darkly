## Where to Locate:

Following from our discovery of the hidden directory stored at http://$IP/.hidden/ we are aware that we
can access arbitrary files on the server that is running the application.

So it only remains to attempt to access a popular target, namely /etc/passwd.

## Exploit:

We do this by performing a path traversal attack stemming from the url http://$IP/index.php?page=
and continue to add "../" to access the parent directory in relation to our relative file path
and appending our desired file, so the file url will look like http://$IP/index.php?page=../etc/passwd

Continueing on with this tactic, we are given various messages as to our distance in relation to our desired
file. Eventually arriving at our destination at the url http://$IP/index.php?page=../../../../../../../etc/passwd

Where we find the flag = b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0

## Prevention:

- The application should validate the user input before processing it. Ideally, the validation should compare against a whitelist of permitted values. If that isn't possible for the required functionality, then the validation should verify that the input contains only permitted content, such as purely alphanumeric characters.