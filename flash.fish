#!/usr/bin/env fish

set UF2_FILE (find build -name "*.uf2" | head -n1)

if test -z "$UF2_FILE"
    echo "No UF2 file found. Build first!"
    exit 1
end

set MOUNTPOINT (find /mnt -maxdepth 1 -type d -name "RPI-RP2" | head -n1)

if test -z "$MOUNTPOINT"
    echo "Pico not mounted. Hold BOOTSEL, plug in Pico, and mount it to /mnt/RPI-RP2"
    exit 1
end

echo "Flashing $UF2_FILE to $MOUNTPOINT"

sudo cp "$UF2_FILE" "$MOUNTPOINT/"
sudo sync

echo "Done!"
