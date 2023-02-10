//
//  ContentView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var test = User()
    @StateObject var searched = Search()
    @ObservedObject var workSpace: WorkSpace
    @ObservedObject var workSpaceFavorite:WorkSpaceFavorites
    @ObservedObject var vm: TestApi
    
    @State private var searchText = ""

    
    var body: some View {
        NavigationStack {
            ZStack {
                
                appColors.primaryColorTwo
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    ScrollView {
                        
                   
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
                                                .frame(maxWidth: 330, maxHeight: 150)
                                                .cornerRadius(10)
                                                .overlay (
                                                    Button {
                                                        self.workSpaceFavorite.appendToFavoritesForYelp(workSpace: workSpaceFavorite)
                                                    } label: {
                                                        Image(systemName: "heart.fill")
//                                                            .font(.system(size:24))
//                                                            .foregroundColor(workSpace.isFavorite ? .pink: .white)
//                                                            .shadow(radius: 10)
                                                            .font(.system(size:30))
                                                            .foregroundColor(workSpaceFavorite.isFavorite ? .pink: .white)
                                                            .shadow(color: appColors.secondaryColorOne, radius: 5, x: 0, y: 0)
                                                    }
                                                    
                                                        .offset(x:145,y:-55)
                                                )
                                            
                                        }
                                        HStack {
                                            Text(test.name ?? "nil")
                                                .font(.headline)
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
                                                .padding(.trailing, 15)
                                    
                                        }
                                    }.padding()
                                    
                                ).padding(.top, 4)
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Catalog")
          
         
            
            
        }  .searchable(text: $searchText)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(workSpace: WorkSpace.example, workSpaceFavorite: WorkSpaceFavorites(), vm: TestApi())
    }
}




