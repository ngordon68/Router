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
                                .frame(width:350, height:350)
                                .cornerRadius(70)
                                .foregroundColor(appColors.primaryColorOne)
                                .overlay(
                                    VStack {
                                        
                                        AsyncImage(url: URL(string: test.imageURL ?? "nil")) { test in
                                            test.image?
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: 300, maxHeight: 250)
                                                .cornerRadius(30)
                                                .overlay (
                                                    Button {
                                                        workSpaceFavorite.appendToFavorites(workspace: workSpace)
                                                    } label: {
                                                        Image(systemName: "heart.fill")
                                                            .font(.system(size:30))
                                                            .foregroundColor(workSpace.isFavorite ? .pink: .white)
                                                    }
                                                    
                                                        .offset(x:120,y:-70)
                                                )
                                            
                                        }
                                        HStack {
                                            Text(test.name ?? "nil")
                                                .font(.title)
                                                .foregroundColor(appColors.primaryColorTwo)
                                                .padding()
                                            
                                            Spacer()
                                            
                                            Rectangle()
                                                .foregroundColor(appColors.secondaryColorTwo)
                                                .frame(width:40, height: 40)
                                                .cornerRadius(10)
                                                .overlay (
                                                    
                                                    Image(systemName: "car.circle")
                                                        .foregroundColor(.white)
                                                    
                                                    
                                                )
                                                .padding()
                                        }
                                    }.padding()
                                    
                                    
                                    
                                    
                                    
                                    
                                )
                            
                            
                            
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
