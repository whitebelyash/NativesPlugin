#!/bin/bash

extract_jar() {
	TARGET=./app/src/main/jniLibs/$2/
	echo "Installing $1 onto $2"
	unzip -j $1.jar "linux/$1/org/lwjgl/vma/liblwjgl_vma.so" -d $TARGET
}

wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/v3.4.1-r4/lwjgl-vma-natives-linux-3.4.1.jar -O x64.jar
wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/v3.4.1-r4/lwjgl-vma-natives-linux-x86-3.4.1.jar -O x86.jar
wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/v3.4.1-r4/lwjgl-vma-natives-linux-arm32-3.4.1.jar -O arm32.jar
wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/v3.4.1-r4/lwjgl-vma-natives-linux-arm64-3.4.1.jar -O arm64.jar

extract_jar x64 x86_64
extract_jar x86 x86
extract_jar arm32 armeabi-v7a
extract_jar arm64 arm64-v8a

echo "Finished"

