//
//  FavoritesView.swift
//  Freemind
////
////  Created by Nick Gordon on 1/23/23.
////
//
import SwiftUI

struct FavoritesView: View {
   
    @ObservedObject var workSpaceFavorite: WorkSpaceFavorites
    @ObservedObject var workSpace: WorkSpace
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                appColors.primaryColorTwo
                    .ignoresSafeArea()
                     
                                
                VStack {
                    Text("Eat more sushi")
                    ScrollView {
                        VStack {
                            
    
                          
                            ForEach(workSpaceFavorite.favoriteWorkSpace)  { workSpace in
                                SpaceRoomLayout(workSpace: workSpace, workSpaceFavorite: workSpaceFavorite)
                                
                            }
                        }
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
        FavoritesView(workSpaceFavorite: WorkSpaceFavorites(), workSpace: .example)
    }
}
