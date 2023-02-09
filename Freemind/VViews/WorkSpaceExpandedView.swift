//
//  WorkSpaceExpandedView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/31/23.
//

import SwiftUI

struct WorkSpaceExpandedView: View {
    
    @ObservedObject var workSpace:WorkSpace
    @ObservedObject var workSpaceFavorite: WorkSpaceFavorites
    
    var body: some View {
        

        
        ZStack {
            appColors.primaryColorTwo
                .ignoresSafeArea()

            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .padding(.all)
                    .foregroundColor(appColors.primaryColorOne)
                    .overlay(
                        VStack {
                            Image(workSpace.roomPicture)
                                .resizable()
                                .frame(width:300, height:300)
                                .cornerRadius(20)
                                .overlay (
                                    Button {
                                        workSpaceFavorite.appendToFavorites(workspace: workSpace)
                                    } label: {
                                        Image(systemName: "heart.fill")
                                            .font(.system(size:30))
                                            .foregroundColor(workSpace.isFavorite ? .pink: .white)
                                            .shadow(color: appColors.secondaryColorOne, radius: 5, x: 0, y: 0)
                                        
                                    }
                                  
                                    .offset(x:110,y:-110)
        
                                )
                            Text(workSpace.roomName)
                                .font(.headline)
                                .padding(.leading)
                                .foregroundColor(appColors.primaryColorTwo)
                            Text(workSpace.roomDescription)
                                .padding(.leading)
                                .foregroundColor(appColors.primaryColorTwo)
                            Grid {
                                GridRow {
                                    Text("Wi-Fi")
                                    Image(systemName: "wifi")
                                }
                                GridRow {
                                    Text("Accessiblity")
                                    Image(systemName: "figure.roll")
                                    
                                }
                            }
                           
                        }
                    )
                
                Button {
                } label: {
                    Text("Share")
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .background(appColors.primaryColorOne)
                        .foregroundColor(appColors.primaryColorTwo)
                        .cornerRadius(8)
                        .controlSize(.large)
                }
                                        
            
            }
            
            
        }
        
    }
}

struct WorkSpaceExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        WorkSpaceExpandedView(workSpace: WorkSpace.example, workSpaceFavorite: WorkSpaceFavorites())
        
    }
}
