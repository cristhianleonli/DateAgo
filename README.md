# DateAgo Extension

This date extension helps to show the "time ago"

## Usage

```swift
let time = Date(timeIntervalSinceNow: -month * 2)
time.timeAgo(as: .minute)
time.timeAgo(as: .hour)
time.timeAgo(as: .day)
time.timeAgo(as: .week)
time.timeAgo(as: .month)
```

## Setting up with Carthage

Carthage is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with Homebrew using the following command:

```sh
$ brew update
$ brew install carthage
```

To integrate DateAgo into your Xcode project using Carthage, specify it in your Cartfile: `github "cristhianleonli/DateAgo"`