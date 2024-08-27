## Where to Locate:

On the http://$IP/ page of our site we find a GET request being made for a PRISM png image, on inspection of the element that utilises this image we find a image that uses an anchor with an href that can be manipulated.

## Background:

We know that for most instances the Content Security Policy precludes most Cross Site Scripting vulnerabilities.

But there is an interesting exception to this in that version 4.1.0 of the CSP whitelists the following four data types, image/gif, image/png, image/jpeg and image/webp while blocking the others by default.

Data URIs enable embedding small files in line in HTML documents, provided in the URL itself. 
This is done by escaping the context of the web application; the web application then delivers that data to its users along with other trusted dynamic content, without validating it. 

The browser unknowingly executes malicious script on the client side (through client-side languages; usually JavaScript or HTML) in order to perform actions that are otherwise typically blocked by the browser’s Same Origin Policy.

## Exploit:

Thus we can use data URI to deliver javascript code that will pass unvalidated to the client side via this method.

We will use a simple example and use the ```<script>alert('XSS')</script>``` tag in base64 encoded format. That converts to, (data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4K) and provide this as the source of the href in the anchor tag.

Now when we click the image we are greeted by the flag which is = 928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d

## Prevention:

1. Sanitizing:

Sanitizing user input is especially helpful on sites that allow HTML markup, to ensure data received can do no harm to users as well as your database by scrubbing the data clean of potentially harmful markup, changing unacceptable user input to an acceptable format.

2. Input Validation:

Validating input is the process of ensuring an application is rendering the correct data and preventing malicious data from doing harm to the site, database, and users.

3. Escaping:

Escaping data means taking the data an application has received and ensuring it’s secure before rendering it for the end user. By escaping user input, key characters in the data received by a web page will be prevented from being interpreted in any malicious way.