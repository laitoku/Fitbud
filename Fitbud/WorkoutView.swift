//
//  ContentView.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import SwiftUI

struct WorkoutView: View {
    @State private var showSheet = false
    @State private var randomImageIndex: Int = 1
    @State private var image: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: 5, x: 2)
                .padding(.vertical, 20)
                Image(image).resizable().aspectRatio(contentMode: .fit)
            }
            Text("Tap exercise to see visual")
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: 5, x: 2)
                    .padding(.vertical, 20)
                List(Scheduled(date: Date()), id: \.description) { set in
                    VStack {
                        Text("Title: \(set.title)")
                        Text("Sets: \(set.sets)")
                        Text("Reps: \(set.reps)")
                        Text("Description: \(set.description)")
                        
                    }.onTapGesture {
                        image = set.title
                        
                    }
                }.frame(height: UIScreen.main.bounds.height / 3).cornerRadius(25)
            }
           
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: 5, x: 2)
                    .frame(height: UIScreen.main.bounds.height / 12)
                
                Button("Finish!") {
                    UpdateMetrics()
                    
                    randomImageIndex = Int.random(in: 1...10)
                    UserDefaults.standard.set(randomImageIndex, forKey: "Food")
                    
                    showSheet = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .sheet(isPresented: $showSheet) {
                    VStack {
                        Text("Get!")
                            .font(.headline)
                            .padding()
                        
                        Image("image\(randomImageIndex)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                    .padding()
                }
                .id(showSheet)
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    WorkoutView()
}
