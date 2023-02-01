//
//  CloudKitViewModel.swift
//  Freemind
//
//  Created by Nick Gordon on 1/24/23.
//

import Foundation
import Combine
import CloudKit


protocol CloudKitableProtocol {
    init?(record: CKRecord)
    var record:CKRecord {get}
}

class User: Identifiable, ObservableObject {
    
    
    var id = UUID()
    var recordID: CKRecord.ID?
    @Published var firstName:String = ""
    @Published var lastName:String = ""
    @Published var userID:String = ""
    @Published var isSignedInToiCloud = false
    @Published var error = ""
    @Published var permissionStatus = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getICloudStatus()
        requestPermission()
        getCurrentUserName()
    }
    
    private func getICloudStatus() {

        CloudKitUtility.getiCloudStatus()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error.localizedDescription
                }

            } receiveValue: { [ weak self  ]  success in
                self?.isSignedInToiCloud = success
            }
            .store(in: &cancellables)

    }
    
    func requestPermission() {
        CloudKitUtility.requestApplicationPermission()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
                
            } receiveValue: { [ weak self  ]  success in
                self?.permissionStatus = success
            }
            .store(in: &cancellables)
        
    }
    
    func getCurrentUserName() {
        CloudKitUtility.discoverUserIdentity()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
                
            } receiveValue: { [ weak self  ]  firstName in
                
                self?.firstName = firstName
                
            }
        
            .store(in: &cancellables)
    }
}
