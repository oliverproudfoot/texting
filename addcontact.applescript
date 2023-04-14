on run argv
    -- Get the arguments passed to the script
    set firstName to item 1 of argv
    set lastName to item 2 of argv
    set emailAddress to item 3 of argv
    set phoneNumber to item 4 of argv
    set groupName to item 5 of argv

    -- Interact with the Contacts app
    tell application "Contacts"
        -- Check if the group exists
        set groupList to groups
        set groupExists to false
        repeat with aGroup in groupList
            if name of aGroup is groupName then
                set theGroup to aGroup
                set groupExists to true
                exit repeat
            end if
        end repeat

        -- Create the group if it doesn't exist
        if not groupExists then
            set theGroup to make new group with properties {name:groupName}
        end if

        -- Check if the contact exists
        set lastNameWithEmoji to lastName & " 🌟"
        set existingContacts to (people whose (first name is firstName) and (last name is lastNameWithEmoji))
        if (count of existingContacts) is greater than 0 then
            set existingContact to item 1 of existingContacts
            set isNewContact to false
        else
            -- Create a new contact if it doesn't exist
            set isNewContact to true
            set existingContact to make new person with properties {first name:firstName, last name:lastNameWithEmoji}
        end if

        -- Add email address if it doesn't exist for the contact
        if emailAddress is not "" then
            set contactEmails to emails of existingContact
            set emailExists to false
            repeat with contactEmail in contactEmails
                if value of contactEmail is emailAddress then
                    set emailExists to true
                    exit repeat
                end if
            end repeat
            if not emailExists then
                make new email at end of emails of existingContact with properties {label:"Work", value:emailAddress}
            end if
        end if

        -- Add phone number if it doesn't exist for the contact
        if phoneNumber is not "" then
            set contactPhones to phones of existingContact
            set phoneExists to false
            repeat with contactPhone in contactPhones
                if value of contactPhone is phoneNumber then
                    set phoneExists to true
                    exit repeat
                end if
            end repeat
            if not phoneExists then
                make new phone at end of phones of existingContact with properties {label:"Work", value:phoneNumber}
            end if
        end if

        -- Add the new contact to the group
        if isNewContact then
            add existingContact to theGroup
        end if

        -- Save the changes
        save
    end tell
    return
end run
