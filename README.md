# DateAgo

Date extension helps to show the "time ago" given a date

### How to use

```swift
let year: TimeInterval = 29_030_400

let time = Date(timeIntervalSinceNow: -year)
print(time.timeAgo(as: .second))    // Interval(value: 29030400, unit: second)
print(time.timeAgo(as: .minute))    // Interval(value: 483840, unit: minute)
print(time.timeAgo(as: .hour))      // Interval(value: 8064, unit: hour)
print(time.timeAgo(as: .day))       // Interval(value: 336, unit: day)
print(time.timeAgo(as: .week))      // Interval(value: 48, unit: week)
print(time.timeAgo(as: .month))     // Interval(value: 12, unit: month)
print(time.timeAgo(as: .year))      // Interval(value: 1, unit: year)
print(time.timeAgo())   
```
