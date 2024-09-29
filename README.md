# Video Conversion Project

このプロジェクトは、MP4動画からフレームを抽出し、各フレームを高品質なWebP形式に変換するためのスクリプトを提供します。使用されるツールにはFFmpeg、Node.js、およびSharpライブラリが含まれます。

## 目次

- [必要な環境](#必要な環境)
- [インストール](#インストール)
- [使い方](#使い方)
- [ディレクトリ構成](#ディレクトリ構成)

## 必要な環境

- Node.js (pnpmパッケージマネージャを推奨)
- FFmpeg
- pnpm

## インストール

### FFmpegのインストール

```sh
brew install ffmpeg
```

### Node.jsのインストール
```sh
brew install node
npm install -g pnpm
```

### プロジェクトの依存関係のインストール
```sh
pnpm install
```

## 使い方
```sh
pnpm run convert2webp
```

## ディレクトリ構成

```
video_conversion/
├── assets/
│   ├── frames/         # フレームを保存するディレクトリ（スクリプトが生成）
│   └── target/         # 対象のMP4ファイルを格納
│       └── CADC2024_top.mp4  # 対象のMP4ファイル
├── output/             # 出力されるWebPファイルの保存ディレクトリ（スクリプトが生成）
├── convert_video.sh    # 統合スクリプト
├── package.json        # Node.jsプロジェクト設定
└── node_modules/       # 依存関係（sharpなどがインストールされる）
```
# video_converter
