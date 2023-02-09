//
//  ChartsView.swift
//  Freemind
//
//  Created by Nick Gordon on 2/8/23.
//

import SwiftUI
import Charts



 struct DataView: View {
     let ambience = ["crowd":0, "cleanliness":5, "noise":1, "temperature":2]
     var body: some View {
         Chart(ambience.keys.sorted(), id: \.self) {
             BarMark(
                 x: .value("person", $0),
                 y: .value("cups bought", ambience[$0] ?? 0)
             )
         }.frame(width: 350, height: 300)
             .chartYAxisLabel("Quality",alignment:.center)
             .chartYAxis {
                 AxisMarks(position: .leading)
             }
             .chartYScale(domain: 0...20)
     }
 }

 struct Contentiew: PreviewProvider {
     static var previews: some View {
        DataView()
     }
 }
