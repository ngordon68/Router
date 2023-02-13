//
//  ContentView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import SwiftUI


struct ContentView: View {
   // @StateObject var test = User()
    //  @StateObject var searched = Search()
    @ObservedObject var workSpaceFavorite:WorkSpaceFavorites
    @ObservedObject var vm: TestApi
   
    @State private var selectedSpace: TestWorkSpace?
    
    var space: TestWorkSpace
    
    //var workSpace:TestWorkSpace
 
    
    @State private var searchText = ""
    @State var workSpace:TestWorkSpace
    
    
    
    func openMaps() {
        
        
        let latitude = 7.065306
        let longitude = 125.607833
        
        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
        
        if UIApplication.shared.canOpenURL(url!) {
              UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        
    }
 
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                appColors.primaryColorTwo
                    .ignoresSafeArea()
                
                
                VStack {
                 
                    Button {
                        openMaps()
                    } label: {
                        Text("test")
                    }
                    
                
                    
                    ScrollView {
                        
                        ForEach(vm.searchResults) { test in
                            
                            
                            
                            
                            Button { selectedSpace = test }
//                            NavigationLink(destination: WorkSpaceExpandedView(yelp: TestApi(), workSpaceFavorite: WorkSpaceFavorites(), slider: SliderModelView(), workSpace: .example))
                        label: {
                          
                                Rectangle()
                                    .foregroundColor(appColors.primaryColorOne)
                                    .frame( height:220)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                                    .padding()
                                
                                    .overlay(
                                        VStack(alignment: .center) {
                                            
                                            // Text(test.isFavorite.description)
                                            
                                            AsyncImage(url: URL(string: test.imageURL ?? "nil")) { photo in
                                                photo.image?
                                                    .resizable()
                                                    .frame(maxWidth: 330, maxHeight: 150)
                                                    .cornerRadius(10)
                                                    .overlay (
                                                        Button {
                                                            
                                                            
                                                        } label: {
                                                            Image(systemName: "heart.fill")
                                                            
                                                                .font(.system(size:30))
                                                            //                                                            .foregroundColor(test.isFavorite ? .pink: .white)
                                                                .shadow(color: appColors.secondaryColorOne, radius: 5, x: 0, y: 0)
                                                        }
                                                        
                                                            .offset(x:145,y:-55)
                                                    )
                                                
                                            }
                                            HStack {
                                                Text(test.name)
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
                                                        
                                                        Button {
                                                            openMaps()
                                                        } label: {
                                                            Image(systemName: "info.circle")
                                                        }
                                                        .buttonStyle(.borderless)
                                                        
                                                        
                                                    )
                                                    .padding(.trailing, 15)
                                                
                                            }
                                        }.padding()
                                        
                                    ).padding(.top, 4)
                                
                                
                                
                            }
                        }
                    }
                    
                }.onAppear(perform: vm.getPosts)
                .sheet(item: $selectedSpace, content: WorkSpaceExpandedView.init)
            }
            .navigationTitle("Catalog")
            
            
            
            
        }  .searchable(text: $vm.searchText)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(workSpaceFavorite: WorkSpaceFavorites(), vm: TestApi(),space: .example, workSpace: .example)
    }
}


let baseurl =  "https://api.yelp.com/v3/businesses/search?location=Detroit&term=Free%20wifi&sort_by=best_match&limit=20"


//let baseurl = "https://api.yelp.com/v3/businesses/search?location=detroit&term=farmer%20market&sort_by=best_match&limit=20"





