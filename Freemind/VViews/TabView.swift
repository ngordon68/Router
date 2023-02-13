//
//  TabView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/25/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var test:User = User() //cloud
    @StateObject var workSpaceFavorite = WorkSpaceFavorites()
    @StateObject var vm: TestApi = TestApi()
 
    var body: some View {
        
            TabView {
                ContentView( workSpaceFavorite: workSpaceFavorite, vm: vm, space: .example,workSpace: .example )
                    .tabItem {
                        Label("Received", systemImage: "list.bullet.below.rectangle")
                    }
//                WorkSpaceExpandedView(yelp: TestApi(), workSpaceFavorite: WorkSpaceFavorites())
//
//                    .tabItem {
//                        Label("Real Time \n Feed", systemImage: "calendar")
//                    }
                FavoritesView(workSpaceFavorite: workSpaceFavorite, vm: vm)
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
