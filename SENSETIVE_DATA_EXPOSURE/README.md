## Where to Locate:

If one visits, http://$IP/index.php/?page=recover# they will find a password recovery page without a visible input field

If we inspect the submit button, we will find a hidden input field with a front-end exposed email in the value attribute

To obtain the flag from this page we simply manipulate the value of this attribute and pressing submit the flag will be exposed

## Prevention:

- Encrypt data during transport and at rest.
- Minimize data surface area.
- Use the latest encrytion algorithms.
- Disable autocomplete on forms that collect data.
- Disable caching on forms that collect data.