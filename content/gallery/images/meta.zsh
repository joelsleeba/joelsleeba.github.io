#!/bin/zsh
rm -rf *.meta
find . -type f ! -name *.zsh -exec touch {}.meta \;
echo '{
    "Tags": ["image","photo"],
    "Title": "sometitle",
    "ImageDescription": "heres one", 
    "ColorLabels": "RGB",
    "Rating": 3
}' >> *.meta
