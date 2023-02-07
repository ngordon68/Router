//
//  WorkSpaceViewModel.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import Foundation

class WorkSpace: Identifiable, ObservableObject, Hashable, Comparable  {
      
    var id = UUID().uuidString
    @Published var roomName: String
    @Published var roomDescription:String
    @Published var roomPicture:String
    @Published var isFavorite = false
    @Published var result = 0
    
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

   
    //make hashable
        static func == (lhs: WorkSpace, rhs: WorkSpace) -> Bool {
            return lhs.roomName == rhs.roomName }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(roomName)
            
        }
    
    static let example = WorkSpace(roomName: "Coffee Bean", roomDescription: "Some text", roomPicture: "Coffee")
    
}


var workSpaces:[WorkSpace] = [
    
    WorkSpace(roomName: "Haraz Coffee Shop", roomDescription: "Some sample text", roomPicture: "Haraz"),
    WorkSpace(roomName: "The Congregation", roomDescription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. ", roomPicture: "Congregation"),
    WorkSpace(roomName: "Capital One Bank", roomDescription: "s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. ", roomPicture: "CapitalOne"),
    WorkSpace(roomName: "Replay Cafe", roomDescription: "Some text", roomPicture: "Coffee"),
    WorkSpace(roomName: "Dinner A", roomDescription: "Sample Text", roomPicture: "Coffee"),
    WorkSpace(roomName: "Nick Space", roomDescription: "s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. ", roomPicture: "Coffee")
]
