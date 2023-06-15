# FiveM / Discord Help Bot

FiveM / Discord Help Bot is a lightweight bot that allows users to send help requests to a staff support channel in a Discord server. 
The bot provides a `/help` command that users can utilize to send their requests along with a reason for needing help, within the FiveM Server. 

## Configuration

In order to use the bot, you need to configure the following settings in the `config.lua` file:

- `webhookURL`: Replace `YOUR_WEBHOOK_URL` with the actual URL of your Discord webhook.
- `webhookUsername`: Set the desired username for the webhook. (Optional)
- `webhookAvatar`: Set the URL for the webhook avatar. (Optional)

### Embed Options

- `embedColor`: Decimal representation of the color for the embedded message.
You can use this website to change HEX to Decimal - https://www.checkyourmath.com/convert/color/hexadecimal_decimal.php

### Mention Role in Discord

- `mentionRole`: Set to `true` if you want to mention a specific role in Discord. 
- `roleId`: Replace `YOUR_ROLE_ID` with the actual ID of the role to mention.

### Show Player Coordinates

- `showCoords`: Set to `true` if you want to display the player's coordinates in the embedded message.
- `coordsDecimal`: Set the number of decimal places to round the coordinates.

## Usage

The bot provides the following command and chat suggestion:

### Command

- `/help`: Sends a help message to staff support in the Discord server.

### Chat Suggestion

Type `/help` and provide a reason for needing help.

## Server-side Code

The `server.lua` file handles the server-side logic for sending help requests to Discord.

## Client-side Code

The `client.lua` file handles the client-side logic for the `/help` command and displaying messages.

## Getting Started

1. Clone the repository: `git clone https://github.com/yourusername/Help-FiveM.git`
2. Create a folder in `/txData/[ServerName]/resources` called `/HelpBot`
3. Paste all 4 files into this folder.
4. Configure the bot settings in `config.lua`.
5. Edit `/txData/[ServerName]/server.cfg` - add the follow code `ensure HelpBot` (Change HelpBot To Whatever The Folder Is Named)
6. Start the server and enjoy using the FiveM / Discord help bot!

## Contributing

Contributions are welcome! Please feel free to submit any issues or pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
