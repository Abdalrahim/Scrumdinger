//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Abdalrahim Al Ayubi  on 15/12/2020.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    private let speechRecognizer = SpeechRecognizer()
    @State private var transcript = ""
    @State private var isRecording = false
    
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining, scrumColor: scrum.color.accessibleFontColor)
                
                MeetingTimerView(isRecording: isRecording ,speakers: scrumTimer.speakers, scrumColor: scrum.color)
                MeetingFooterView(speakers: $scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker, scrumColor: scrum.color)
            }
            .padding()
            //.foregroundColor(scrum.color)
        }
        .padding()
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            speechRecognizer.record(to: $transcript)
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
            speechRecognizer.stopRecording()
            isRecording = false
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrumTimer.secondsElapsed / 60, transcript: transcript)
            scrum.history.insert(newHistory, at: 0)
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[1]))
    }
}
