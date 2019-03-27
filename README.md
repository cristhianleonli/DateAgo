# DateAgo Extension

This date extension helps to show the "time ago"

## Usage

```swift
let month: TimeInterval = 2_419_200

let time = Date(timeIntervalSinceNow: -month * 5)
print(time.timeAgo(as: .minute))    // Interval(value: 201600, unit: minute)
print(time.timeAgo(as: .hour))      // Interval(value: 3360, unit: hour)
print(time.timeAgo(as: .day))       // Interval(value: 140, unit: day)
print(time.timeAgo(as: .week))      // Interval(value: 20, unit: week)
print(time.timeAgo(as: .month))     // Interval(value: 5, unit: month)
print(time.timeAgo())               // Interval(value: 5, unit: month)
```

## Setup

* Carthage: `github "cristhianleonli/DateAgo"`
* Or just copy the file `DateAgo/ExtensionDateAgo.swift`