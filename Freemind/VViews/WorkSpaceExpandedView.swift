//
//  WorkSpaceExpandedView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/31/23.
//

import SwiftUI

struct WorkSpaceExpandedView: View {
    
  //  @ObservedObject var slider:SliderModelView
    
    //first connector
    var workSpace: TestWorkSpace
    
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
                                AsyncImage(url: URL(string: workSpace.imageURL ?? "nil"))
                                    //.resizable()
                                    .frame(width:300, height:300)
                                    .cornerRadius(20)
                                    .overlay (
                                        Button {
                                          
                                        } label: {
                                            Image(systemName: "heart.fill")
                                                .font(.system(size:30))
                                                .foregroundColor(.white)
                                                .shadow(color: appColors.secondaryColorOne, radius: 5, x: 0, y: 0)

                                        }

                                            .offset(x:110,y:-110)

                                    )
                                Text(workSpace.name)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(appColors.primaryColorTwo)
                                HStack {
                                    Text("Address:")
                                    Text(workSpace.location?.address1 ?? "no address")
                                
                                }   .font(.subheadline)
                                    .bold()
                                    .foregroundColor(appColors.primaryColorTwo)
                                
                                HStack {
                                    Text("Phone:")
                                    Text(workSpace.displayPhone ?? "no address")
                                
                                }   .font(.subheadline)
                                    .bold()
                                    .foregroundColor(appColors.primaryColorTwo)
                                
                              
                                //show alias
                            
                                
                              
//                                Grid {
//                                    GridRow {
//                                        Text("Wi-Fi")
//                                        Image(systemName: "wifi")
//                                    }
//                                    GridRow {
//                                        Text("Accessiblity")
//                                        Image(systemName: "figure.roll")
//
//                                    }
//                                }
                                
                                
//
//                            DataView(slider: slider)
//                                    .frame(height:5)
                                
                                //.padding(.bottom,200)
                            } //Rectangle VStack ends here
                            

                            
                        )

                    Button {
                    } label: {
                        Text("Maps")
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
        WorkSpaceExpandedView(workSpace: .example)
        
    }
}
