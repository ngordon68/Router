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
    @ObservedObject var vm: TestApi

    var body: some View {
        NavigationStack {
            ZStack {

                appColors.primaryColorTwo
                    .ignoresSafeArea()


                VStack {

                    ScrollView {

                        Text("Test Api below")





                    }

                }
            }
            .navigationTitle("Favorites")


        }
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(workSpaceFavorite: WorkSpaceFavorites(), vm: TestApi())
    }
}
