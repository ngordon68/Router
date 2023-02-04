//
//  ContentView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import SwiftUI


struct SpaceRoomLayout: View {
    
    @ObservedObject var workSpace:WorkSpace
    @ObservedObject var workSpaceFavorite: WorkSpaceFavorites
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
           
            
            Image(workSpace.roomPicture)
                .resizable()
                .frame(height:150)
                .cornerRadius(20)
                .overlay (
                    Button {
                        workSpaceFavorite.appendToFavorites(workspace: workSpace)
                    } label: {
                        Image(systemName: "heart.fill")
                            .font(.system(size:30))
                            .foregroundColor(workSpace.isFavorite ? .pink: .white)
                    }
                  
                    .offset(x:160,y:-50)
                )
            Text(workSpace.roomName)
                .font(.headline)
                .padding(.leading)
                .foregroundColor(appColors.primaryColorOne)
            Text(workSpace.roomDescription)
                .padding(.leading)
                .foregroundColor(appColors.primaryColorOne)
            
            
            
        }
        .padding(.top, 20)
    }
}

struct ContentView: View {
    @StateObject var test = User()
    @StateObject var searched = Search()
    @ObservedObject var workSpace: WorkSpace
    @ObservedObject var workSpaceFavorite:WorkSpaceFavorites

    
    var body: some View {
        NavigationStack {
            ZStack {
                appColors.primaryColorTwo
                    .ignoresSafeArea()
                
                VStack {
                
                
                    ScrollView {
                        LazyVStack {
                            ForEach(searched.searchResults)  { workSpace in
                                SpaceRoomLayout(workSpace: workSpace, workSpaceFavorite: workSpaceFavorite)
                                
                            }
                        }
                    }
                    
                }.navigationTitle("Catalogue")
                .searchable(text: $searched.searchText, prompt: Text("Search here")  )
                    
                .padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(workSpace: WorkSpace.example, workSpaceFavorite: WorkSpaceFavorites())
    }
}




