//
//  ContentView.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import SwiftUI

struct WorkoutView: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var startDate = Date()
    @State private var currentDate = Date()
    @State var started = false

    var body: some View {
        VStack {
            var time = Int(currentDate.timeIntervalSince(startDate))
            if started {
                Text("\(time)")
                    .onReceive(timer) { input in
                        currentDate = input
                        if time >= 15 {
                            self.timer.upstream.connect().cancel()
                            started = false
    //                                            self.startDate = Date()
    //                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        }
                    }
            }
            
            ProgressView(value: Float(time), total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white)
                .shadow(radius: 5, x: 2)
                .padding(.vertical, 20)
            
            Gauge(value: 0.2, in: 0...1) {
                /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
            
            ZStack {
                Circle()
                    .fill(.white)
                    .strokeBorder(.red, lineWidth: 7)
                    .shadow(color: .gray, radius: 1)
//                Text("Timer Here")
                Button(started ? "Stop" : "Start") {
                    started.toggle()
                    startDate = Date()
                    time = 0
                }
                if started {
                    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }
            }.padding()

            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }.padding()
    }
}

#Preview {
    WorkoutView()
}
