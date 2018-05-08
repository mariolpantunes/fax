#!/usr/bin/env bash

notify-send -t 15000 FAX "Iniciar Scan de documentos"
scanimage -p --mode Gray --resolution 200 --compression JPEG  --jpeg-quality 10 > /tmp/scan.jpeg
convert /tmp/scan.jpeg /tmp/input.pdf
rm /tmp/scan.jpeg
qpdf --linearize /tmp/input.pdf /tmp/scan.pdf
rm /tmp/input.pdf
notify-send -t 3000 FAX "Enviar mail"
thunderbird -compose "attachment=/tmp/scan.pdf"
rm /tmp/scan.pdf
