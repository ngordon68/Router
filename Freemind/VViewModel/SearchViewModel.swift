//
//  SearchViewModel.swift
//  Freemind
//
//  Created by Nick Gordon on 2/3/23.
//

import Foundation

class Search: ObservableObject {
    
    @Published var searched = [WorkSpace]()
    @Published private (set) var selected = [WorkSpace]()
    @Published var searchText = ""
 
    
    var searchResults: [WorkSpace] {
        if searchText.isEmpty {
            return workSpaces
        } else {
            return workSpaces.filter {  $0.roomName.localizedCaseInsensitiveContains(searchText)  }
            }
        }
}
