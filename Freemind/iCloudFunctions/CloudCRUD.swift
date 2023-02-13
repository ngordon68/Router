//
//  CloudCRUD.swift
//  Freemind
//
//  Created by Nick Gordon on 1/26/23.
//

import Foundation
import CloudKit
import Combine
import UIKit
import SwiftUI

let container = CKContainer(identifier: "iCloud.MindMapDataBase")

let recordLabel = "Work_Spaces"



struct FruitModel: Hashable, CloudKitableProtocol {
    let name:String
    let description:String
  //  let imageURL: URL?
    let record: CKRecord
    
    init?(record: CKRecord) {
        guard let name = record["name"]  as? String else {return nil}
        self.name = name
//        let imageAsset = record["image"] as? CKAsset
//        self.imageURL = imageAsset?.fileURL
        guard let description = record["description"]  as? String else {return nil}
        self.description = description
        self.record = record
    }
    init?(name: String, description: String?) {
        let record = CKRecord(recordType: recordLabel)
        record["name"] = name
//        if let url = imageURL {
//            let asset = CKAsset(fileURL: url)
//            record["image"] = asset
//          }
        
        if let description = description {
            record["description"] = description
        }
        
        self.init(record: record)
        
        /// this initializer is called when you decode data from JSON (from disk or cloud)
//        init() {
//            // look up init from decoder, Codable protocol
//        }
        
        
        
    }
    func update(newName: String) -> FruitModel? {
        let record = record
        record["name"] = "New Name"
        return FruitModel(record: record)
    }
}


class UserListViewModel:ObservableObject {
    
    @Published var text:String = ""
    //@Published var users: [UserViewModel] = []
    @Published var fruits: [FruitModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
        fetchItems()
    }
    
    
    func addButtonPressed(name:String) {
        guard !text.isEmpty else { return }
        addItem(name: text)
    }
    
    // crud
    //add image parameter back into guard let statement
    private func addItem(name: String) {
//        guard
//            let image = UIImage(named: "DJ"),
//            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("DJ.jpeg"),
//            let data = image.jpegData(compressionQuality: 1.0) else { return }
//
        do {
//            try data.write(to: url)
            guard let newFruit = FruitModel(name: name, description: "test") else {return}
            CloudKitUtility.addOrUpdate(item: newFruit) { result in
                print(result)
            }
            //change to append to array. use switch to solve this instead of fetching again
        } catch let error { 
            print(error)
        
        }
    }
    
    func fetchItems() {
        let predicate = NSPredicate(value: true)
        let recordType = recordLabel
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [ weak self  ]  returnedItems in
                self?.fruits = returnedItems
            }
            .store(in: &cancellables)
        
    }
    
    func addOrUpdateItem(fruit: FruitModel) {
        guard let newFruit = fruit.update(newName: "New Name") else {return}
        CloudKitUtility.addOrUpdate(item: newFruit) { [weak self]
            result in
            print("Success")
            self?.fetchItems()
        }    }
    
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let fruit = fruits[index]
        
        CloudKitUtility.delete(item: fruit)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self]  success in
                print("Delete is: \(success)")
                self?.fruits.remove(at: index)
            }
            .store(in: &cancellables)
    }
    
    //replace CKContainer.default.publicClouddatabase
    private func saveUser(record: CKRecord) {
        container.publicCloudDatabase.save(record) { returnedRecord, returnedError in
            if let returnedError = returnedError {
                print("error: \(returnedError)")
            } else {
                print("record :\(returnedRecord)")
            }
        }
    }
}
