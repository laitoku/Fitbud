//
//  MetricLine.swift
//  Fitbud
//
//  Created by Joshua Lai on 12/13/24.
//

import SwiftUI

struct MetricLine: View {
    @State var titles: [String]
    @Binding var total: Int
    @Binding var total2: Int
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                VStack {
                    Image(titles[0]).resizable().aspectRatio(contentMode: .fit).frame(width: 50).foregroundColor(.red)
                    Text("\(titles[0]): \(total)")
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                VStack {
                    Image(titles[1]).resizable().aspectRatio(contentMode: .fit).frame(width: 50).foregroundColor(.red)
                    Text("\(titles[1]): \(total2)")
                }
            }
        }.padding(.horizontal)
    }
}

#Preview {
    MetricLine(titles: ["on", "tw"], total: .constant(1), total2: .constant(2))
}
