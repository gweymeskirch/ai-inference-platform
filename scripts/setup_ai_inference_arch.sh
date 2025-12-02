#!/bin/bash
echo "Mise à jour système et installation des dépendances Arch Linux..."
sudo pacman -Syu --noconfirm python python-pip base-devel git usbutils
if ! command -v yay &> /dev/null; then
  echo "Installation de yay (AUR helper)..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

echo "Installation CUDA, cudnn et onnxruntime-gpu via yay..."
yay -S --noconfirm cuda cudnn python-onnxruntime-gpu

echo "Installation des dépendances Python via pip..."
pip install --upgrade pip
pip install onnxruntime-gpu tflite-runtime opencv-python-headless pycoral

echo "Installation terminée."
