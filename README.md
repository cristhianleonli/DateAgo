# DateAgo Extension

This date extension helps to show the "time ago"

## Usage

```swift
let year: TimeInterval = 29_030_400

let time = Date(timeIntervalSinceNow: -year * 1)
print(time.timeAgo(as: .second))    // Interval(value: 29030400, unit: second)
print(time.timeAgo(as: .minute))    // Interval(value: 483840, unit: minute)
print(time.timeAgo(as: .hour))      // Interval(value: 8064, unit: hour)
print(time.timeAgo(as: .day))       // Interval(value: 336, unit: day)
print(time.timeAgo(as: .week))      // Interval(value: 48, unit: week)
print(time.timeAgo(as: .month))     // Interval(value: 12, unit: month)
print(time.timeAgo(as: .year))      // Interval(value: 1, unit: year)
print(time.timeAgo())               // Interval(value: 1, unit: year)
```

## Setup

* Carthage: `github "cristhianleonli/DateAgo"`
* Or just copy the file [DateAgo/ExtensionDateAgo.swift](https://github.com/cristhianleonli/DateAgo/blob/master/DateAgo/ExtensionDateAgo.swift)