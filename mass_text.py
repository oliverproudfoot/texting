import os
import argparse
import pandas as pd

def add_contact_to_group(first_name, last_name, group_name, email='', phone=''):
    """
    Add a contact to the specified group using AppleScript. This will create the group and the contact if they don't exist.
    """
    script_path = 'addcontact.applescript'
    os.system(f'osascript {script_path} "{first_name}" "{last_name}" "{email}" "{phone}" "{group_name}"')

def send_message(recipient_number, message):
    """
    Send a message using AppleScript.
    """
    os.system("osascript sendMessage.applescript {} {}".format(recipient_number, message))

def main():
    # Add argparse functionality
    parser = argparse.ArgumentParser(description='Send messages and add contacts to a group.')
    parser.add_argument('tsv_file', help='CSV file containing contact information')
    parser.add_argument('message_file', help='Text file containing the message')

    args = parser.parse_args()

    # Read message from the text file
    with open(args.message_file, 'r') as file:
        message_template = file.read()

    df = pd.read_csv(args.tsv_file, sep="\t", header=None)
    df.columns = ["first", "last", "number", "email"]

    for _, row in df.iterrows():
        add_contact_to_group(row["first"], row["last"], "Ushers", row["email"], row["number"])
        
        # Use format_map() to replace placeholders with the corresponding values from the row
        personalized_message = message_template.format_map(row.to_dict())
        send_message(row["number"], personalized_message)

if __name__ == "__main__":
    main()
