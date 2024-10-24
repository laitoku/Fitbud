//
//  HomeView.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text(Date.now, format: .dateTime.weekday().day()).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding(.leading)
            
            Divider()
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(height: UIScreen.main.bounds.height / 3)
                Text("Pet Here")
            }
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    if !Scheduled(date: Date()).isEmpty {
                        List(Scheduled(date: Date()), id: \.description) { set in
                            VStack {
                                Text("Description: \(set.description)")
                                Text("Reps: \(set.reps)")
                                Text("Time: \(set.time)")
                            }
                        }.cornerRadius(25).listStyle(PlainListStyle()).padding(5)
                    } else {
                        Text("No Workout Today!")
                    }
                }
//                        .aspectRatio(contentMode: .fit)
                
                VStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                    
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(maxHeight: UIScreen.main.bounds.height / 12)
                    .padding(.vertical, 2)
//                .aspectRatio(contentMode: .fit)
                NavigationLink(destination: WorkoutView(), label: {Text("Start!")})
               
            }
        }
    }
}

#Preview {
    HomeView()
}
