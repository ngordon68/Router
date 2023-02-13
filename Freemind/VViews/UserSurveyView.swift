//
//  UserSurveyView.swift
//  Freemind
//
//  Created by Nick Gordon on 2/10/23.
//

import SwiftUI

struct SliderModel: Identifiable {
    
    var id = UUID().uuidString
    var meter:Double
    var Title: String
    var leftOption:String
    var middleOption:String
    var RightOption: String
    //  var colorSetting:Color
    
}

class SliderModelView: Identifiable, ObservableObject {
    
    @Published var meterBind:Double = 0
    @Published var sliders:[SliderModel] = [
        
        SliderModel(meter: 3, Title: "Crowd", leftOption: "Light", middleOption: "Neutral", RightOption: "Busy"),
        SliderModel(meter: 3, Title: "Noise", leftOption: "Test1", middleOption: "Test2", RightOption: "Test3"),
        SliderModel(meter: 3, Title: "Tidiness", leftOption: "Test1", middleOption: "Test2", RightOption: "Test3"),
        SliderModel(meter: 3, Title: "Temperature", leftOption: "Test3", middleOption: "Test1", RightOption: "Test3")
    ]
}

struct UserSurveyView: View {

    @StateObject var sliders = SliderModelView()
    var body: some View {
        ZStack {
            
            appColors.primaryColorTwo
                .ignoresSafeArea()
            
            VStack {
                    Rectangle()
                        .frame(width:350, height:50)
                        .cornerRadius(20)
                        .foregroundColor(appColors.primaryColorOne)
                        .overlay(
                            
                            Text("Location Survey")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                            
                        )
                    
                    Text("Upon arrival how was the environment?")
                        .foregroundColor(appColors.primaryColorOne)
                        .font(.title)
                
                ScrollView {
                    
                    ForEach ($sliders.sliders)  { $slider in
                        
                        VStack {
                            Text(slider.Title)
                                .foregroundColor(appColors.primaryColorOne)
                                .font(.title)
                                .bold()
                            
                            
                            
                            Rectangle()
                                .frame(width:330, height:20)
                                .cornerRadius(20)
                                .foregroundColor(appColors.primaryColorOne)
                                .overlay (
                                    Slider(
                                        
                                        value: $slider.meter,
                                        in: 1...3,
                                        step: 1.0
                                        
                                    ).accentColor(appColors.primaryColorOne)
                                )
                                .padding(.bottom, 100)
                            
                            HStack {
                                Spacer()
                                Text(slider.leftOption)
                                Spacer()
                                Text(slider.middleOption)
                                Spacer()
                                Text(slider.RightOption)
                                Spacer()
                            }
                            .foregroundColor(appColors.primaryColorOne)
                            .bold()
                            .font(.headline)
                            .offset(y:-80)
                            
                        }
                        
                    } // ForEach
                }  //ScrollView
                
                Circle()
                    .frame(height:100)
                    .foregroundColor(appColors.primaryColorOne)
                    .overlay (
                        
                        Text("Submit")
                            .foregroundColor(appColors.primaryColorTwo)
                    
                    )
                    .offset(y:-20)
                
            } //VStack
        }
    }
}


struct UserSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        UserSurveyView()
    }
}
