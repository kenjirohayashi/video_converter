# video_converter

このプロジェクトは、MP4 動画からフレームを抽出し、各フレームを高品質な WebP 形式に変換するためのスクリプトを提供します。使用されるツールには FFmpeg、Node.js、および Sharp ライブラリが含まれます。

## 目次

- [必要な環境](#必要な環境)
- [インストール](#インストール)
- [使い方](#使い方)
- [ディレクトリ構成](#ディレクトリ構成)

## 必要な環境

- macOS
- FFmpeg
- cwebp

## インストール

### FFmpeg のインストール

```sh
brew install ffmpeg
```

### cwebp のインストール

```sh
brew install cwebp
```

## 使い方

```sh
chmod +x convert_video.sh
./convert_video.sh
```

## ディレクトリ構成

```
video_conversion/
├── assets/
│   ├── frames/         # フレーム(JPG)を保存するディレクトリ（スクリプトが生成）
│   ├── webp/           # WebPファイルを保存するディレクトリ（スクリプトが生成）
│   └── target/         # 対象のMP4ファイルを格納（チームの管理者から受け取ってください）
└──  convert_video.sh    # 統合スクリプト
```
