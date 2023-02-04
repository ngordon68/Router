//
//  HeaderView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/24/23.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        ZStack {
          
            HStack {
                Text("This should show on the main screen")
                    .font(.largeTitle)
                    .foregroundColor(appColors.primaryColorTwo)
              
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
