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
    @ObservedObject var vm: TestApi
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                appColors.primaryColorTwo
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    ScrollView {
                        
                        Text("Test Api below")
                        
                        ForEach(vm.testworkspaces) { test in
                            Rectangle()
                                .foregroundColor(appColors.primaryColorOne)
                                .frame( height:220)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                .padding()
                               
                                .overlay(
                                    VStack(alignment: .center) {
                                        
                                        AsyncImage(url: URL(string: test.imageURL ?? "nil")) { test in
                                            test.image?
                                                .resizable()
                                                .frame(maxWidth: 310, maxHeight: 150)
                                                .cornerRadius(10)
                                                .overlay (
                                                    Button {
                                                        workSpaceFavorite.appendToFavorites(workspace: workSpace)
                                                    } label: {
                                                        Image(systemName: "heart.fill")
                                                            .font(.system(size:24))
                                                            .foregroundColor(workSpace.isFavorite ? .pink: .white)
                                                            .shadow(radius: 10)
                                                    }
                                                    
                                                        .offset(x:130,y:-50)
                                                )
                                            
                                        }
                                        HStack {
                                            Text(test.name ?? "nil")
                                                .font(.title)
                                                .bold()
                                                .padding(.leading)
                                                .foregroundColor(appColors.primaryColorTwo)
                                               
                                            
                                            Spacer()
                                            
                                            Rectangle()
                                                .foregroundColor(appColors.secondaryColorTwo)
                                                .frame(width:40, height: 40)
                                                .cornerRadius(10)
                                                .overlay (
                                                    
                                                    Image(systemName: "car.circle")
                                                        .foregroundColor(.white)
                                                    
                                                    
                                                )
                                                Spacer()
                                        }
                                    }.padding()
                                    
                                ).padding(.top, 4)
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Favorites")
            
            
        }
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(workSpaceFavorite: WorkSpaceFavorites(), workSpace: .example, vm: TestApi())
    }
}
