//
//  SplashScreenView.swift
//  Freemind
//
//  Created by Nick Gordon on 2/4/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Image("BackGround")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                Text("Mind Map")
                    .font(.largeTitle)
                    .foregroundColor(appColors.primaryColorTwo)
            
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
