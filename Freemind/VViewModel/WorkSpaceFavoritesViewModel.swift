//
//  WorkSpaceFavoritesViewModel.swift
//  Freemind
//
//  Created by Nick Gordon on 2/3/23.
//

import Foundation
class WorkSpaceFavorites: Identifiable, ObservableObject {
    
    @Published var favoriteWorkSpace:[WorkSpace] = [WorkSpace]()
    
    
    func appendToFavorites(workspace: WorkSpace) {
        workspace.isFavorite.toggle()
       if workspace.isFavorite == true {
            favoriteWorkSpace.append(workspace)
          
           

        }
        if workspace.isFavorite == false {
            if let index = favoriteWorkSpace.firstIndex(of: workspace) {
                favoriteWorkSpace.remove(at: index)
            }
        }
     
    }

}
