//
//  TabView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/25/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var test:User = User()
    
    var body: some View {
        
            TabView {
                ContentView()
                    .tabItem {
                        Label("Received", systemImage: "list.bullet.below.rectangle")
                    }
                ReservationsView(test: test)
                    .badge(5)
                    .tabItem {
                        Label("Real Time \n Feed", systemImage: "calendar")
                    }
                FavoritesView(workSpace: .example)
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
        }
    }


struct TabView_Previews: PreviewProvider {
   
    static var previews: some View {
        MainView()
    }
}
