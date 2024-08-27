## Where to Locate:

If we visit the http://$IP/?page=feedback page we observe there an input field for the Name and a text area for the message of a user providing feedback.

Upon inspection of the elements we a find two functions to verify that the Name and Message fields are not null.

Although we can input a name with an empty message textarea and it will pass the validation because of a flaw in the validation function

All attempts to edit the validation function and the values for the input fields are not reflected on the page.

So attempts were made to inject code into the the provided fields.

## Exploit:

Attempting to inject a simple alart script into the Name input field with the maxlength altered ```<script>alert('test');<\/script>``` 

One can observe that some validation function removes the initial script tag and allows the rest of the input. So we know that there is some check for an opening and closing tag to prevent XSS, but the regex
is flawed because it only caters for anything between the first opening and closing tags.

Knowing this if we simply input the the script again while respecting the maxlength of 10 the script is accepted as a valid input.

This is primarly due to flawed validation.

The flag received from this is = 0fbb54bbf7d099713ca4be297e1bc7da0173d8b3c21c1811b916a3a86652724e

## Prevention:

In general, effectively preventing XSS vulnerabilities is likely to involve a combination of the following measures:

- Filter input on arrival. At the point where user input is received, filter as strictly as possible based on what is expected or valid input.

- Encode data on output. At the point where user-controllable data is output in HTTP responses, encode the output to prevent it from being interpreted as active content. Depending on the output context, this might require applying combinations of HTML, URL, JavaScript, and CSS encoding.

- Use appropriate response headers. To prevent XSS in HTTP responses that aren't intended to contain any HTML or JavaScript, you can use the Content-Type and X-Content-Type-Options headers to ensure that browsers interpret the responses in the way you intend.

- Content Security Policy. As a last line of defense, you can use Content Security Policy (CSP) to reduce the severity of any XSS vulnerabilities that still occur.
