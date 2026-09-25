# AmbientBGM Mobile

ambientbgm.com を WebView で開くだけの Capacitor 8 アプリ (iOS / Android)。
`capacitor.config.json` の `server.url` で本番サイトを直接読み込むので、`www/` は
読み込み中に出るだけのページ。public リポジトリなので README は英語、このファイルだけ日本語。

元は `cyberneura/ambientbgm` の `mobileapp/` にあった (CYBERNEURA-DEV-859 で分離)。
Web プレイヤー本体はあちらのリポジトリにある。

## 手順

```shell
pnpm install
pnpm exec cap sync      # capacitor.config.json を ios/ と android/ に反映する
pnpm exec cap open ios
```

- `ios/App/App/capacitor.config.json` と `android/app/src/main/assets/capacitor.config.json`
  は `cap sync` が生成する (gitignore 済み)。設定はルートの `capacitor.config.json` を直す
- iOS の依存は Swift Package Manager (`ios/App/CapApp-SPM`)。CocoaPods は使っていない
- **このホスト (Linux) では iOS / Android のビルドはできない。** `cap sync` までは通る
- バージョンは iOS が `project.pbxproj` の `MARKETING_VERSION` / `CURRENT_PROJECT_VERSION`、
  Android が `android/app/build.gradle` の `versionName` / `versionCode`

## チャット UI を出さない仕組み

`appendUserAgent: "AmbientBGMApp"` で User-Agent にトークンを足している。
ambientbgm.com (webapp の `chatVisibility.ts`) はこのトークンがあるとチャットウィジェットを出さない。
トークン名を変える時は webapp 側と揃えること。

## App Store

将来 App Store で配信する予定。未着手 (署名・プロビジョニング・審査用メタデータは未設定)。
