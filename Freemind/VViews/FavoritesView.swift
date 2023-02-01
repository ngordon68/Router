//
//  FavoritesView.swift
//  Freemind
////
////  Created by Nick Gordon on 1/23/23.
////
//
import SwiftUI

struct FavoritesView: View {
//    @ObservedObject var test:User
    //@ObservedObject private var searched:Search
   
    
  // @ObservedObject var workSpace:WorkSpaceFavorites = WorkSpaceFavorites()
   // @ObservedObject var workSpaceFavorites:WorkSpaceFavorites
    
    var body: some View {
        NavigationView {
            ZStack {
                
                appColors.primaryColorTwo
                     .ignoresSafeArea()
                                
                VStack {
                    ScrollView {
//                        LazyVStack {
//                            ForEach(workSpace.favoriteWorkSpace)  { escaperoom in
//                                SpaceRoomLayout(escapeRoomVM: escaperoom)
//
//                            }
//                        }
                    }
                }
                .navigationTitle("Favorites")
                .padding()
                
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
