## Where to Locate:

Apon visiting http://$IP/?page=survey we are greeted with a table that asks us to grade 5 members of the 42 paris staff.

This can be done by choosing values from a select list for each team member that will allot them 1-10 points.

## Exploit:

If one were to inspect these select lists one would find each option and the value associated with it assigned as a value in the option attribute

If one manipulates these values and selects the associated list number the flag for this page is revealed.

## Prevention:

Input Validation: 

Assume all input is malicious. Use an "accept known good" input validation strategy, i.e., use a list of acceptable inputs that strictly conform to specifications. Reject any input that does not strictly conform to specifications, or transform it into something that does.

When performing input validation, consider all potentially relevant properties, including length, type of input, the full range of acceptable values, missing or extra inputs, syntax, consistency across related fields, and conformance to business rules. As an example of business rule logic, "boat" may be syntactically valid because it only contains alphanumeric characters, but it is not valid if the input is only expected to contain colors such as "red" or "blue."

Do not rely exclusively on looking for malicious or malformed inputs. This is likely to miss at least one undesirable input, especially if the code's environment changes. This can give attackers enough room to bypass the intended validation. However, denylists can be useful for detecting potential attacks or determining which inputs are so malformed that they should be rejected outright.