//
//  ReservationsView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//

import SwiftUI
import CloudKit

struct ReservationsView: View {
    
   // @ObservedObject var test:User
  //  @StateObject var user = UserListViewModel()
  //  @ObservedObject var workspace:WorkSpace
    @ObservedObject var vm: TestApi
    
    
    

   

    
    var body: some View {
        VStack {
            Text("test \(vm.testworkspaces.count)")
            ScrollView {
                LazyVStack {
                    ForEach(vm.testworkspaces) { workSpace in
                        HStack {
                            Text(workSpace.name ?? "nothing")
                            Text("\(workSpace.reviewCount!)")
                            // Text(workSace.location!.address1 ?? "NOTHING!" )
                            AsyncImage(url: URL(string: workSpace.imageURL!))
                                .frame(width:50, height:50)
                                
                            
                        }
                        
                        
                    }
                }.onAppear(perform: vm.getPosts)
            }
            
           
        }
//        .task {
//            do {
//                try await workspace.fetch()
//            } catch {
//                print("error")
//            }
//        }
        
//        NavigationView {
//
//            ZStack {
//
//                appColors.primaryColorOne
//                    .ignoresSafeArea()
//
//                VStack {
//
//                    TextField("Type here", text: $user.text)
//
//                    Button {
//
//                        user.addButtonPressed(name: "TEST")
//
//                    } label: {
//                        Text("save")
//                            .foregroundColor(appColors.secondaryColorOne)
//                    }
//                    Text("Permission: \(test.permissionStatus.description)")
//                    Text("is signed in: \(test.isSignedInToiCloud.description)")
//
//                                    List {
//                                        ForEach(user.fruits, id: \.self) { fruit in
//                                            HStack {
//                                                Text(fruit.name)
//                                                Text(fruit.description)
//                                            }
//
//
//                                        }
//                                    }
//
//                }.navigationTitle("\(test.firstName) Reservations")
//            }
//        }
    }
}

//struct ReservationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReservationsView()
//    }
//}
