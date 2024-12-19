//
//  MetricsView.swift
//  Fitbud
//
//  Created by Joshua Lai on 12/13/24.
//

import SwiftUI

struct MetricsView: View {
    @State var totals: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State var totalDays = 0

    
    var body: some View {
        ScrollView {
            Text("Metrics").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).multilineTextAlignment(.leading).padding(.leading).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            VStack {
                MetricLine(titles: ["Push Ups", "Dips"], total: $totals[0], total2: $totals[1])
                MetricLine(titles: ["Squats", "Lunges"], total: $totals[2], total2: $totals[3])
                MetricLine(titles: ["Calf Raises", "Crunches"], total: $totals[4], total2: $totals[5])
                MetricLine(titles: ["Bicycles", "Supermans"], total: $totals[6], total2: $totals[7])
                MetricLine(titles: ["Jumping Jacks", "Total Days Completed"], total: $totals[8], total2: $totalDays)
            }.padding(.bottom).font(.title2)
        }.onAppear {
            DispatchQueue.main.async {
                let d = DatabaseHelper()
                totals = d.retrieveMetrics()
                totalDays = UserDefaults.standard.integer(forKey: "completedDays")
            }
        }
        .background(.red)
    }
}

#Preview {
    MetricsView()
}
