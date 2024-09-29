#!/bin/bash

# フレームレート
FRAME_RATE=20

# 画像生成
ffmpeg -i ./assets/target/CADC.mp4 -r $FRAME_RATE -q:v 1 ./assets/frames/frame%d.jpg

# WebP変換を行うNode.jsスクリプト
node - <<EOF
const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

// 画像が収納されているディレクトリ
const inputDir = path.resolve(__dirname, 'assets/frames');
const outputDir = path.resolve(__dirname, 'output');

// 出力ディレクトリが存在しない場合、作成する
if (!fs.existsSync(outputDir)){
    fs.mkdirSync(outputDir);
}

// 入力ディレクトリ内のファイルを読み込む
fs.readdir(inputDir, (err, files) => {
    if (err) {
        return console.error('Unable to scan directory: ' + err);
    }

    // JPEGファイルのみを対象とする
    files.forEach(file => {
        if (['.jpg', '.jpeg'].includes(path.extname(file).toLowerCase())) {
            const inputFilePath = path.join(inputDir, file);
            const outputFilePath = path.join(outputDir, path.basename(file, path.extname(file)) + '.webp');

            sharp(inputFilePath)
                .webp({ quality: 100 })
                .toFile(outputFilePath)
                .then(() => {
                    console.log('Successfully converted: ' + file + ' to ' + outputFilePath);
                })
                .catch(err => {
                    console.error('Error converting file: ' + file, err);
                });
        }
    });
});
EOF
