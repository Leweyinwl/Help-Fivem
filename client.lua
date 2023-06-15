-- client.lua

-- Add a chat suggestion for the /help command
TriggerEvent('chat:addSuggestion', '/help', 'Sends a Help Message To Staff Support in Discord Server', {
    { name='Reason', help='Enter the reason why you need help here' }
})

RegisterNetEvent('displayMessage')
AddEventHandler('displayMessage', function(message)
    -- Display the message.
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {"SYSTEM", message}
    })
end)

RegisterCommand('help', function(source, args)
    -- Check if args is empty
    if #args == 0 then
        -- If args is empty, display a message saying that a reason is required
        TriggerEvent('displayMessage', 'Reason is required.')
    else
        -- Get player's coordinates
        local coords = GetEntityCoords(PlayerPedId())
        if coords then
            -- Convert the vector to a table
            local coordsTable = {x = coords.x, y = coords.y, z = coords.z}

            -- Encode the coordinates table as JSON
            local coordsJson = json.encode(coordsTable)
            
            -- Trigger the server-side event and send coordinates along with the other arguments
            TriggerServerEvent('sendHelpToDiscord', args, coordsJson)
        else
            -- Trigger the server-side event and send only the other arguments
            TriggerServerEvent('sendHelpToDiscord', args, {})
        end
    end
end)