#!/bin/bash

# フレームレート
FRAME_RATE=20
# 画質
WEBP_QUALITY=80

# 入力動画ファイルのパス
INPUT_VIDEO="./assets/target/CADC.mp4"
# 出力jpg画像のディレクトリ
OUTPUT_JPG_FRAMES_DIR="./assets/frames"
# 出力webp画像のディレクトリ
OUTPUT_WEBP_FRAMES_DIR="./assets/webp"

# フォルダ作成
if [ ! -d "$OUTPUT_JPG_FRAMES_DIR" ]; then
  rm -rf "$OUTPUT_JPG_FRAMES_DIR"
  mkdir -p "$OUTPUT_JPG_FRAMES_DIR"
fi
if [ ! -d "$OUTPUT_WEBP_FRAMES_DIR" ]; then
  rm -rf "$OUTPUT_WEBP_FRAMES_DIR"
  mkdir -p "$OUTPUT_WEBP_FRAMES_DIR"
fi

# 画像生成
ffmpeg -i $INPUT_VIDEO -r $FRAME_RATE -q:v 1 $OUTPUT_JPG_FRAMES_DIR/frame%d.jpg

# WebP 変換
for jpg_file in "$OUTPUT_JPG_FRAMES_DIR"/*.jpg; do
  webp_file="${jpg_file%.jpg}.webp"
  cwebp -q $WEBP_QUALITY "$jpg_file" -o $OUTPUT_WEBP_FRAMES_DIR/$(basename $webp_file)
done
