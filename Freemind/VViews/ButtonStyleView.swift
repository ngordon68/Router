//
//  ButtonStyleView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/24/23.
//

import SwiftUI


struct ButtonStyleView: View {
    
    //var appColors = AppColors()
    
    var body: some View {
                            
        VStack {
            
            Text("to")
                .font(.largeTitle)
                .foregroundColor(Color(red: 0.669, green: 0.804, blue: 0.19))
 
            HStack {
                Circle()
                    .foregroundColor(appColors.primaryColorTwo)
                Circle()
                    .foregroundColor(appColors.primaryColorOne)
                Circle()
                    .foregroundColor(appColors.primaryColorTwo)
            }
            HStack {
                Circle()
                    .foregroundColor(appColors.secondaryColorOne)
                Circle()
                    .foregroundColor(appColors.secondaryColorTwo)
            }
            
        }
    }
}


struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}
