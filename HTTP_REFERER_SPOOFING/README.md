## Where to Locate:

The home page of our address http://$IP/ we find a copyright in the footer that also acts as a link to a hidden page.

On this page we find a paragraph written in french with a picture of a bird.
Upon further inspection of this page we find a long comment embedded in the HTML where we find some clues as to how we might go about obtaining our next flag.

First we come across the string <!-- You must cumming from : "https://www.nsa.gov/" to go to the next step -->
And then later in the comment the the string <!-- Let's use this browser : "ft_bornToSec". It will help you a lot. -->

The reference to "you must be coming from" gives us the clue that we must be refered from the link included
This reminds us of the old exploit of spoofing the referer.

## Exploit:

We can accomplish this by running a simple script with the second string "ft_bornToSec" as our referer and use the hidden link and the first string link as our second and third inputs and see what returns.

A lot is returned from running this script without some filtering.

So we will pipe the return through the utility 'grep' to make it more legible, by passing the string "flag".

This returns a more usable return with the flag = f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188

## Prevention:

There is no 100% method to stop a spoofed HTTP referer because it's sent by the client and the server has no way to verify it. A possible solution is to store the current page URL in a cookie and then check it against the supplied referer when the next page is loaded. 

There are things you can do to identify requests in addition to the HTTP_REFERER. In short, the HTTP_REFERER value cannot be trusted.