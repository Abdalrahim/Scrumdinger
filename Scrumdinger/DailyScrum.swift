//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Esar Tech  on 15/12/2020.
//

import SwiftUI

struct DailyScrum: Identifiable {
    let id : UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    var history: [History]
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color, history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.history = history
    }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color(#colorLiteral(red: 0.1607843137, green: 0.6117647059, blue: 0.6588235294, alpha: 1))),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color(#colorLiteral(red: 0.4078431373, green: 0.8392156863, blue: 0.5764705882, alpha: 1))),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, color: Color(#colorLiteral(red: 0.937254902, green: 0.4470588235, blue: 0.3803921569, alpha: 1))),
            DailyScrum(title: "Backend", attendees: ["Dick", "Richard"], lengthInMinutes: 15, color: Color(#colorLiteral(red: 0.537254902, green: 0.2117647059, blue: 0.3764705882, alpha: 1)))
        ]
    }
}

let colors = [Color(#colorLiteral(red: 0.1607843137, green: 0.6117647059, blue: 0.6588235294, alpha: 1)), Color(#colorLiteral(red: 0.4078431373, green: 0.8392156863, blue: 0.5764705882, alpha: 1)), Color(#colorLiteral(red: 0.937254902, green: 0.4470588235, blue: 0.3803921569, alpha: 1)), Color(#colorLiteral(red: 0.537254902, green: 0.2117647059, blue: 0.3764705882, alpha: 1)), Color(#colorLiteral(red: 0.6274509804, green: 0.8431372549, blue: 0.8862745098, alpha: 1))]

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = colors.randomElement()!
    }

    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }

    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
    }
}
