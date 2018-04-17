# DateAgo Extension

This date extension helps to show the "time ago"

## Usage

Function `timeAgoDisplay` shows the time ago, by default in english, but language can be customized
```swift
let twoHoursAgo = Date(timeIntervalSinceNow: -60 * 60 * 2)
print(twoHoursAgo.timeAgoDisplay()) // 2 hours ago

// To use preset languages TimeLanguage.english(by default)
// or TimeLanguage.spanish
print(twoHoursAgo.timeAgoDisplay(withLanguage: TimeLanguage.spanish)) // Hace 2 horas

// You can custom preset languages or even create a new one
let timeAgo = TimeAgo(position: .pre, text: "Il y a", momentAgoText: "Juste maintenant")
let french = TimeLanguage(second: TimeUnit(singular: "seconde", plural: "secondes"),
                    minute: TimeUnit(singular: "minute", plural: "minutes"),
                    hour: TimeUnit(singular: "heure", plural: "heures"),
                    day: TimeUnit(singular: "jour", plural: "jours"),
                    week: TimeUnit(singular: "semaine", plural: "semaines"),
                    month: TimeUnit(singular: "mois", plural: "mois"),
                    timeAgoText: timeAgo)
print(twoHoursAgo.timeAgoDisplay(withLanguage: french)) // Il y a 2 heures
```