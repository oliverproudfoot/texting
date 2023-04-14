on run {targetBuddyPhone, targetMessage}
    -- Interact with the Messages app
    tell application "Messages"
        -- Get the first SMS service available
        set targetService to 1st service whose service type = SMS

        -- Get the buddy (contact) with the specified phone number
        set targetBuddy to buddy targetBuddyPhone of targetService

        -- Send the message to the target buddy
        send targetMessage to targetBuddy
    end tell
end run
