
import SwiftUI
import Charts


struct SliderChart: Identifiable {
    var id = UUID().uuidString
    var type: String
    var count: Double
}
 struct DataView: View {
    // let ambience = ["crowd":0, "cleanliness":3, "noise":1, "temperature":2]
     @ObservedObject var slider:SliderModelView
     
     var data: [SliderChart] = [
        .init(type: "test" , count: 2),
        .init(type: "d", count: 3)
        
     ]
     
     
     var body: some View {
         Chart(data) { data in
             BarMark(
                x: .value("person", data.type),
                y: .value("cups bought", data.count)
             )
         }.frame(width: 350, height: 300)
             .chartYAxisLabel("Quality",alignment:.center)
             .chartYAxis {
                 AxisMarks(position: .leading)
             }
             .chartYScale(domain: 0...3)
     }
 }

 struct Contentiew: PreviewProvider {
     static var previews: some View {
        DataView(slider: SliderModelView())
     }
 }
