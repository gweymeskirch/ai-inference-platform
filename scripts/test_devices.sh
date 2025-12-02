#!/bin/bash
echo "=== Test détection GPU NVIDIA ==="
if command -v nvidia-smi &> /dev/null; then
  nvidia-smi
else
  echo "nvidia-smi non trouvé, GPU peut ne pas être installé"
fi

echo "=== Test détection USB Coral ==="
if lsusb | grep -i "Google"; then
  echo "USB Coral détecté"
else
  echo "USB Coral non détecté"
fi
