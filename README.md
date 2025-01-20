# standly_rich
standly_rich is a simple and lightweight rich presence script for FiveM that allows you to easily update your Discord presence while playing on your server. With this resource, you can display custom status messages, details, and activity directly on your Discord profile, enhancing the experience for both players and server owners.


# Features

- Easy-to-setup rich presence integration for Discord.
- Customizable text fields for displaying server information.
- Lightweight and optimized for performance.

# Installation

1. Download or clone the repository to your `resources` folder.
2. Add `start standly_rich` to your `server.cfg`.
3. Customize the configuration file to match your server's unique status.

# Exports

```lua 
exports["standly_rich"]:updateDiscordPresence(mainText, smallImageText, imageText, smallImage, bigImage)
```
- **mainText(string or nil)**: The text displayed in the main rich presence
- **smallImageText(string or nil)**: The text displayed in the small image
- **imageText(string or nil)**: The text displayed in the big image
- **smallImage(string or nil)**: The image displayed in the small image
- **bigImage(string or nil)**: The image displayed in the big image
