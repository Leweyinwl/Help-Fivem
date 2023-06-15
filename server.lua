-- server.lua

-- Event handler for sending help requests to Discord
RegisterServerEvent('sendHelpToDiscord')
AddEventHandler('sendHelpToDiscord', function(args, coordsJson)
    local playerId = source
    local playerName = GetPlayerName(playerId)

    -- Check if playerName is available
    if playerName then
        -- Prepare the default embed fields
        local embedFields = {
            {['name'] = '**Player Name**', ['value'] = playerName},
            {['name'] = '**Reason**', ['value'] = table.concat(args, ' ')}
        }

        -- Decode the coordinates JSON string
        local coordsTable = json.decode(coordsJson)

        -- Get the configured coordsDecimal value or default to 2 decimal places
        local coordsDecimal = tonumber(coordsDecimal) or 2

        -- Add coordinates field if showCoords is true and coordinates are available
        if showCoords and coordsTable then
            local x = string.format("%." .. coordsDecimal .. "f", coordsTable.x)
            local y = string.format("%." .. coordsDecimal .. "f", coordsTable.y)
            local z = string.format("%." .. coordsDecimal .. "f", coordsTable.z)
            local coordinates = "🆇: " .. x .. "\n 🆈: " .. y .. "\n 🆉: " .. z
            table.insert(embedFields, {['name'] = '🌐 Location 🌐', ['value'] = coordinates})
        end

        -- Mention the role if mentionRole is true, otherwise leave it blank
        local mention = mentionRole and ("<@&".. roleId .. ">") or ""

        -- Prepare the embed message for Discord
        local embedMessage = {
            {
                ["color"] = embedColor,
                ["type"] = "rich",
                ["title"] = "🆘 Help Needed! 🆘",
                ["fields"] = embedFields,
                ["footer"] = {
                    ["text"] = 'Created By Leweyiwnl 💖',
                    ["icon_url"] = 'https://cdn.discordapp.com/avatars/303626697612197898/e331fa8814a71eed74cd47adbfb79dd7.webp'
                },
            }
        }

        -- Assign default webhookUsername if it is blank
        webhookUsername = webhookUsername ~= "" and webhookUsername or "Help! 🆘"

        -- Assign default webhookAvatar if it is blank
        webhookAvatar = webhookAvatar ~= "" and webhookAvatar or "https://cdn.discordapp.com/avatars/97096332799377408/297b3199a6ee5208251ee8c136412983.png"

        -- Prepare the HTTP request
        local request = {
            ['url'] = webhookURL,
            ['method'] = 'POST',
            ['headers'] = {
                ['Content-Type'] = 'application/json'
            },
            ['data'] = json.encode({
                ['content'] = mention,
                ['embeds'] = embedMessage,
                ['username'] = webhookUsername,
                ['avatar_url'] = webhookAvatar,
            })
        }

        -- Send the HTTP request to the webhook URL
        PerformHttpRequest(request.url, function(error, text, headers)
            if error == "" then
                TriggerClientEvent('displayMessage', playerId, 'Failed To Send Your Request to Support. Please Try Again.')
            else
                TriggerClientEvent('displayMessage', playerId, 'Your Request Was Successfully Sent To Support.')
            end
        end, request.method, request.data, request.headers)
    else
        TriggerClientEvent('displayMessage', playerId, 'Failed to get player name. Please try again.')
    end
end)

-- Print initialization message
print("[INFO] Help script has started correctly ✅.")
