//
//  HomeView.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import SwiftUI
import SpriteKit

struct HomeView: View {
    @State private var completed: Bool = false
    @State private var streak: Int = 0

    
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
                PetView()
            }
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    if completed {
                        VStack {
                            Text("Today's Workout")
                            List(Scheduled(date: Date()), id: \.description) { set in
                                VStack(alignment: .leading) {
                                    Text("Title: \(set.title)")
                                    Text("Sets: \(set.sets)")
                                    Text("Reps: \(set.reps)")
                                }
                            }.cornerRadius(25).listStyle(PlainListStyle()).padding(5)
                        }.padding(.top)
                    } else {
                        Text("No Workout Today!")
                    }
                }.onAppear {
                    DispatchQueue.main.async {
                        completed = false
                        let s = Scheduled(date: Date())
                        
                        if s.isEmpty {
                            completed = false
                        } else {
                            completed = true
                        }
                    }
                }
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.white)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                        VStack {
                            Image(systemName: "flame").resizable().aspectRatio(contentMode: .fit).frame(width: 50).foregroundColor(.red)
                            Text("Streak: \(streak)")
                        }
                        .onAppear {
                            DispatchQueue.main.async {
                                streak = UserDefaults.standard.integer(forKey: "streak")
                            }
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.blue)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                        Button(action: {
                            SkipDay()
                            completed = false
                        }) {
                            Text("Skip Day").font(.title3).foregroundColor(.white)
                        }
                    }
                    
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.red)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(maxHeight: UIScreen.main.bounds.height / 12)
                    .padding(.vertical, 2)
                NavigationLink(destination: WorkoutView(), label: { Text("Start!").font(.title).foregroundColor(.white) })
               
            }
        }
    }
}

#Preview {
    HomeView()
}
