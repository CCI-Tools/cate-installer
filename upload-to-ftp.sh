#!/usr/bin/env bash

# current version is 0.8.0rc5 b2

function upload_ftp {
    echo Uploading ${1}: ${2}
    curl --ftp-create-dirs -T $2 -u "$FTP_USER:$FTP_PASSWORD" "ftp://$FTP_HOST/software/$TRAVIS_OS_NAME/"
}

# core

ls -lR cate-desktop/dist/

echo "success pushing artifacts to FTP..."
upload_ftp "miniconda" "cate*.sh"

# desktop

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    upload_ftp "dmg" "cate-desktop/dist/Cate*.dmg"
    upload_ftp "mac" "cate-desktop/dist/mac/Cate*mac.zip"
else
    upload_ftp "AppImage" "cate-desktop/dist/cate*.AppImage"
    upload_ftp "tar.gz" "cate-desktop/dist/cate*.tar.gz"
    upload_ftp "zip" "cate-desktop/dist/cate*.zip"
fi
