//
//  ContentView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import SwiftUI

class WorkSpaceFavorites: ObservableObject {
    @Published var favoriteWorkSpace:[WorkSpace] = [WorkSpace]()
    
//    func appendToFavorites(workspace: WorkSpace) {
//        self.isFavorite.toggle()
//        if self.isFavorite == true {
//            favoriteWorkSpace.append(self)
//            print("change \(favoriteWorkSpace.count)")
//
//        }
//    }
    
    func append(workSpace: WorkSpace) {
        workSpace.isFavorite.toggle()
        
    }
}

var globalWorkSpace:[WorkSpace] = [WorkSpace]()

class WorkSpace: Identifiable, ObservableObject {
    
  
    
    var id = UUID()
    @Published var roomName: String
    @Published var roomDescription:String
    @Published var roomPicture:String
    @Published var isFavorite = false
    
    init( roomName: String, roomDescription: String, roomPicture: String, isFavorite: Bool = false) {
        //self.id = id
        self.roomName = roomName
        self.roomDescription = roomDescription
        self.roomPicture = roomPicture
        self.isFavorite = isFavorite
    }
    
    static func <(lhs: WorkSpace, rhs: WorkSpace) -> Bool {
        lhs.roomName < rhs.roomName
    }
    func toggleFavorite() {
        self.isFavorite.toggle()
        //appendToFavorites()
  
    }
    

    static let example = WorkSpace(roomName: "Coffee Bean", roomDescription: "Some text", roomPicture: "Coffee")

}


var escapeRooms:[WorkSpace] = [
    
    WorkSpace(roomName: "Bank B", roomDescription: "Some sample text", roomPicture: "Coffee"),
    WorkSpace(roomName: "Bank A", roomDescription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. ", roomPicture: "Coffee"),
    WorkSpace(roomName: "Gym A", roomDescription: "s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. ", roomPicture: "Coffee"),
    WorkSpace(roomName: "Gym B", roomDescription: "Some text", roomPicture: "Coffee"),
    WorkSpace(roomName: "Dinner A", roomDescription: "Sample Text", roomPicture: "Coffee"),
    WorkSpace(roomName: "Nick Space", roomDescription: "s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. ", roomPicture: "Coffee"),
]




struct SpaceRoomLayout: View {
    
   @StateObject var escapeRoomVM = WorkSpace(roomName: "Coffe Bean", roomDescription: "Place to study", roomPicture: "Coffee")
    @StateObject var workSpace = WorkSpaceFavorites()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            Image(escapeRoomVM.roomPicture)
                .resizable()
                .frame(height:150)
                .cornerRadius(20)
                .overlay (
                    Button {
                        workSpace.append(workSpace: escapeRoomVM)
                    } label: {
                        Image(systemName: "heart.fill")
                            .font(.system(size:30))
                            .foregroundColor(escapeRoomVM.isFavorite ? .pink: .white)
                    }
                  
                    .offset(x:160,y:-50)
                )
            Text(escapeRoomVM.roomName)
                .font(.headline)
                .padding(.leading)
                .foregroundColor(appColors.primaryColorOne)
            Text(escapeRoomVM.roomDescription)
                .padding(.leading)
                .foregroundColor(appColors.primaryColorOne)
            
            
            
        }
        .padding(.top, 20)
    }
}

struct ContentView: View {
    @StateObject var test = User()
    @StateObject var searched = Search()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                appColors.primaryColorTwo
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(searched.searchResults)  { escaperoom in
                                SpaceRoomLayout(escapeRoomVM: escaperoom)
                                
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
        ContentView()
    }
}


class Search: ObservableObject {
    
    @Published var searched = [WorkSpace]()
    @Published private (set) var selected = [WorkSpace]()
    @Published var searchText = ""
 
    
    var searchResults: [WorkSpace] {
        if searchText.isEmpty {
            return escapeRooms
        } else {
            return escapeRooms.filter {  $0.roomName.localizedCaseInsensitiveContains(searchText)  }
            }
        }
}

