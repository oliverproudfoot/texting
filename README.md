# Intro

`mass_text.py` allows the user to send personalized messages and add contacts to a group using AppleScript. The current version of the script reads a TSV file with four columns: first name, last name, phone number, and email address, and a text file containing a message template. The script then iterates through each row in the TSV file, adds the contact to a specified group, and sends a personalized message to the contact's phone number.

## Sending a Mass Text:

You need to create a TSV file with your contact information and a message file (.txt) with your personalized message. The TSV file should have four columns: first name, last name, phone number, and email address. The message file should contain a message template with placeholders for the contact information you want to include.

Once you have your TSV file and message file ready, you can run the script by typing the following command in the terminal:

```python mass_text.py people.tsv message.txt```

I have included example files.

## Update the Script to Include More Information in Personalized Messages

If you want to include more information in the personalized messages, you will need to modify the TSV file and the message template accordingly.

To update the TSV file, you can add additional columns with the information you want to include. For example, you can add a "birthday" column or an "anniversary" column. Be sure to update the column names in the script so that the script can read the new columns correctly. For instance, if you add a "birthday" column, you would change the line in `mass_text.py` that reads:

```df.columns = ["first", "last", "number", "email"]```

to:

```df.columns = ["first", "last", "number", "email", "birthday"]```

Similarly, if you want to include the "birthday" information in the personalized messages, you would modify the message template file to include the "{birthday}" placeholder.

