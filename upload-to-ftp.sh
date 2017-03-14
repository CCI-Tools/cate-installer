#!/usr/bin/env bash

function upload_ftp {
    echo "uploading $1 to $2"
    curl --ftp-create-dirs -T $2 -u "$FTP_USER:$FTP_PASSWORD" "ftp://$FTP_HOST/software/$TRAVIS_OS_NAME/"
}

# core

echo "success pushing artifacts to FTP..."
upload_ftp "miniconda" "cate*.sh"

# desktop

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    upload_ftp "dmg" "cate-desktop/dist/Cate*.dmg"
    upload_ftp "mac" "cate-desktop/dist/mac/Cate*mac.zip"
else
    upload_ftp "AppImage" "cate-desktop/dist/cate*.AppImage"
fi
