## How to Locate

On the home page http://$IP/ if one has the console open they will notice an error associated with a cookie titled "I_am_admin"

This cookie can be manipulated in mulitple ways, 3 are detailed below...

## FIREFOX:

Selecting the Requests tab on the console will allow us to see all the requests made by our browswer
Here we will see the GET request for the http://$IP/ that is the same location given for the cookie error
We can get more information about this request by opening the drop down button

Apon doing so we see several fields of information about the request, here we can further investigate the cookie that is causing the error by clicking on the cookies tab
Here we see the response cookie with the title "I_am_admin" with a value="68934a3e9455fa72420237eb05902327"
This is a md5 value which if decoded has the value "false"

Since this seems to be a cookie associated with the priveleges of the user, we would like to escalate this.
Since we know the value of the cookie was a md5 hash, we will simply encode the value "true" in md5 and insert that into our cookie
After which we refresh the page so the server can retrieve it, after which we recieve a flag in the form of a pop-up

## CHROME:

1. Open Chrome DevTools
2. Click the Application tab to open the Application panel. The Manifest pan will probably open.
3. Under Storage expand Cookies, then select an origin.
4. Here we have access to the cookie value which is an md5 hash for the value "false"
5. Hashing the value "true" and editing the cookie to have this value then refreshing will give us our flag

## CURL:

After decrypting the cookie value and hashing the new value "true" we can send this new value to the page via CURL
with the followig command: ```curl -b 'I_am_admin=b326b5062b2f0e69046810717534cb09' http://10.203.65.229/ | grep 'Flag'```

This will return the flag.

## Prevention:

As cookie poisoning is fairly easy to do, adequate cookie-poisoning protection should detect cookies that were modified on a client machine by verifying that cookies which are sent by the client are identical to the cookies that were set by the server.