#!/bin/bash

# unilwjgl3 release
RELEASE=v3.4.1-r4

extract_jar() {
	TARGET=./app/src/main/jniLibs/$2/
	echo "Installing $3 onto $2 (arch $1)"
	unzip -j $1.jar "linux/$1/org/lwjgl/$3/liblwjgl_$3.so" -d $TARGET
}

echo "Downloading lwjgl-$1 natives"

wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/$RELEASE/lwjgl-$1-natives-linux-3.4.1.jar -O x64.jar
wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/$RELEASE/lwjgl-$1-natives-linux-x86-3.4.1.jar -O x86.jar
wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/$RELEASE/lwjgl-$1-natives-linux-arm32-3.4.1.jar -O arm32.jar
wget https://github.com/MojoLauncher/unilwjgl3-builder/releases/download/$RELEASE/lwjgl-$1-natives-linux-arm64-3.4.1.jar -O arm64.jar

extract_jar x64 x86_64 $1
extract_jar x86 x86 $1
extract_jar arm32 armeabi-v7a $1
extract_jar arm64 arm64-v8a $1

echo "Finished"

