//
//  TimeAgo.swift
//  Utilities
//
//  Created by Cristhian León
//  Copyright © 2018 Cristhian León. All rights reserved.
//

public struct TimeAgo {

    public init(position: Position?, text: String?, momentAgoText: String?) {
        self.position = position
        self.text = text
        self.momentAgoText = momentAgoText
    }

    /// defines where the text "ago" goes, at the begining or the end of text
    public enum Position {
        /// similar to english, "5 minutes ago"
        case pos
        /// similar to spanish, "Hace 5 minutos"
        case pre
    }
    /// position of word "ago"
    public var position: Position?
    /// text in case it's not "ago", like spanish is "Hace"
    public var text: String?
    /// text in case you want to replace "0 seconds ago" with "just now"
    public var momentAgoText: String?
}
