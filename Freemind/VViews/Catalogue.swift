//
//  ContentView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import SwiftUI


//struct SpaceRoomLayout: View {
//    
//    @ObservedObject var workSpace:WorkSpace
//    @ObservedObject var workSpaceFavorite: WorkSpaceFavorites
//    @ObservedObject var vm: TestApi
//    
//    var body: some View {
//        
//        Rectangle()
//            .foregroundColor(appColors.secondaryColorOne)
//     
//
//            .frame(height:230)
//            .border(.gray)
//           
//           
//            .cornerRadius(30)
//            .shadow(radius: 20)
//            .padding()
//       
//                        .overlay (
//        VStack(alignment: .center) {
//            
//           
//            
//            Image(workSpace.roomPicture)
//                .resizable()
//                
//                .frame(height:150)
//                .cornerRadius(20)
//                
//                .overlay (
//                    Button {
//                        workSpaceFavorite.appendToFavorites(workspace: workSpace)
//                    } label: {
//                        Image(systemName: "heart.fill")
//                            .font(.system(size:30))
//                            .foregroundColor(workSpace.isFavorite ? .pink: .white)
//                    }
//                  
//                    .offset(x:140,y:-50)
//                )
//            HStack {
//                
//                Text(workSpace.roomName)
//                    .font(.title)
//                    .bold()
//                    .padding(.leading)
//                    .foregroundColor(appColors.primaryColorOne)
//                
//                Spacer()
//                
//                Rectangle()
//                    .foregroundColor(appColors.primaryColorOne)
//                    .frame(width:40, height: 40)
//                    .cornerRadius(5)
//                    .overlay (
//                    
//                    Image(systemName: "car.circle")
//                        .foregroundColor(.white)
//                    
//                    )
//                
//                Spacer()
//                    
//            }
//        }
//        .padding()
//        )
//        
//        .padding(.top, 20)
//    }
//}

struct ContentView: View {
    @StateObject var test = User()
    @StateObject var searched = Search()
    @ObservedObject var workSpace: WorkSpace
    @ObservedObject var workSpaceFavorite:WorkSpaceFavorites
    @ObservedObject var vm: TestApi

    
    var body: some View {
        NavigationStack {
            ZStack {
                appColors.secondaryColorTwo
                    .ignoresSafeArea()
                
                VStack {
                
                    ScrollView {
                        LazyVStack {
                            
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
                                                            self.workSpaceFavorite.appendToFavorites(workspace: workSpace)
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
                .searchable(text: $searched.searchText, prompt: Text("Search here"))
                    
                .padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(workSpace: WorkSpace.example, workSpaceFavorite: WorkSpaceFavorites(), vm: TestApi())
    }
}




