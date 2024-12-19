//
//  MilestonesView.swift
//  Fitbud
//
//  Created by Joshua Lai on 12/13/24.
//

import SwiftUI

struct MilestonesView: View {
    @State var fill: [Color] = [.white, .white, .white]
    @State var check: [String] = ["1.circle", "10.circle", "20.circle"]

    var body: some View {
        VStack {
            Text("Milestones").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).multilineTextAlignment(.leading).padding(.leading).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(fill[0])
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(maxHeight: UIScreen.main.bounds.height / 12)
                    .padding(.vertical, 2)
                Label("Complete Your First Workout!", systemImage: check[0]).font(.title3)
            }.onAppear {
                let x = UserDefaults.standard.integer(forKey: "completedDays")
                if x > 0 {
                    fill[0] = .green
                    check[0] = "checkmark.diamond"
                    UserDefaults.standard.set(1, forKey: "Gift")
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(fill[1])
                    .shadow(radius: 10)
                    .frame(maxHeight: UIScreen.main.bounds.height / 12)
                    .padding(.vertical, 2)
                Label("Complete 10 Workouts", systemImage: check[1]).font(.title3)
            }.onAppear {
                let x = UserDefaults.standard.integer(forKey: "completedDays")
                if x >= 10 {
                    fill[1] = .green
                    check[1] = "checkmark.diamond"
                    UserDefaults.standard.set(2, forKey: "Gift")
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(fill[2])
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(maxHeight: UIScreen.main.bounds.height / 12)
                    .padding(.vertical, 2)
                Label("Complete 20 Workouts", systemImage: check[2]).font(.title3)
            }.onAppear {
                let x = UserDefaults.standard.integer(forKey: "completedDays")
                if x >= 20 {
                    fill[2] = .green
                    check[2] = "checkmark.diamond"
                    UserDefaults.standard.set(3, forKey: "Gift")
                }
            }
        }.padding().frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
    }
}

#Preview {
    MilestonesView()
}
