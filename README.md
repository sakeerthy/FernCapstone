# Fern
This application is designed to collect eye-tracking data for potential concussion patients. It currently offers two tests: smooth pursuit and saccadic.

Apple released a revolutionary new feature to their 2017 version of the iPhone called FaceID. FaceID uses their new front fracing camera called the TrueDepth camera. The TrueDepth camera includes "A dot projector throws over 30,000 dots onto the user's face, which are then captured by an infrared camera. To ensure the system operates properly in the dark, a flood illuminator adds more infrared light when needed". This new feature is used heavily in their new OS for things like FaceID and animojis. But this advanced technology can be used for many applications outside of its designed use case. For our application, we leveraged the infrared camera to perform eye-tracking. We implemented two eye-tracking tests, saccadic and smooth pursuit, that could be used by doctors to diagnose concussions. 

## Features

- [x] Smooth Pursuit Test
- [x] Saccadic Test

## Requirements

- iPhone X, Xr, Xs
- iOS 12+
- XCode 10.x

## Installation
#### Get the Files
Clone this github repo and cd into the directory

#### CocoaPods
If you do not have CocoaPods installed, download it at [CocoaPods](http://cocoapods.org/).
Once CocoaPods is installed, run 'pod install' and allow the dependencies to finish downloading.

#### XCode
After connecting your iPhone using a USB cable, change the dropdown menu in the top-left corner to use your connected device.
Build and run the application and it will appear on your iOS device

## Created by
Romy Abourdarham
Ben Ewing
Tucker Jaenicke
Ross Kamen
Suneeth Keerthy
