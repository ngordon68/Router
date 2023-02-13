//
//  WorkSpaceFavoritesViewModel.swift
//  Freemind
//
//  Created by Nick Gordon on 2/3/23.
//
//

import Foundation
class WorkSpaceFavorites: Identifiable, ObservableObject {
    
 

    @Published var favoriteBusinesses:[TestWorkSpace] = []
    
    
    //    func appendToFavorites(workspace: WorkSpace) {
    //        workspace.isFavorite.toggle()
    //        print("done")
    //       if workspace.isFavorite == true {
    //            favoriteWorkSpace.append(workspace)
    //
    //        }
    //        if workspace.isFavorite == false {
    //            if let index = favoriteWorkSpace.firstIndex(of: workspace) {
    //                favoriteWorkSpace.remove(at: index)
    //            }
    //        }
    //
    //    }
    
    func appendToFavoritesForYelp(workSpace:TestWorkSpace) {
        
       // var workSpaced =  workSpace
        
        
       // workSpace.isFavorite.toggle()
        print("toggle")
       
        
     //  workSpaced = workSpace
       // print(workSpace.isFavorite.description)
        
        
       
    
    }
    
//    func changeYelpModel(workSpace: TestWorkSpace) {
//        
//        appendToFavoritesForYelp(workSpace: workSpace)
//    }
}
