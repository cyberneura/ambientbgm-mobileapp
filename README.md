# AmbientBGM Mobile

iOS and Android app for [AmbientBGM.com](https://ambientbgm.com), a free ambient
music player.

The app is a [Capacitor](https://capacitorjs.com/) wrapper that loads
`https://ambientbgm.com/` in a native WebView (`server.url` in
`capacitor.config.json`). The player itself lives in
[cyberneura/ambientbgm](https://github.com/cyberneura/ambientbgm); `www/` only
holds the page shown while it loads.

## Setup

```shell
pnpm install
pnpm sync           # cap sync: copies capacitor.config.json into the native projects
pnpm open:ios       # opens Xcode
pnpm open:android   # opens Android Studio
```

`deploy.sh` runs `cap sync` and opens Xcode in one go.

Build, sign and run from Xcode / Android Studio as usual. Distribution through the
App Store is planned but not set up yet.

## How the web page knows it is inside the app

`appendUserAgent` in `capacitor.config.json` adds `AmbientBGMApp` to the WebView's
User-Agent. The site hides its support chat widget for that User-Agent (it also
does so for `?no-chat=1`), since the widget would otherwise sit on top of the
player on a phone screen.

## License

MIT
