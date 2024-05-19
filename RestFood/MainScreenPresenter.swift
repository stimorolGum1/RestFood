//
//  MainScreenPresenter.swift
//  RestFood
//
//  Created by Danil on 31.01.2024.
//

import Foundation
import FirebaseFirestoreInternal
protocol MainScreenPresenterProtocol: AnyObject {
    func prepareCategoriesForCollection(index: IndexPath) -> String
    func prepareName(index: IndexPath) -> String
    func modelCountForTableView(section: Int) -> Int
    func modelCountForCollection() -> Int
    func openDetailFood()
    func modelSection(section: Int) -> String
    func prepareCost(index: IndexPath) -> String
    //func readTest()
}

class MainScreenPresenter {
    
    weak var view: MainScreenViewControllerProtocol?
    var model: foodModel!
   
    let router: Routes
    typealias Routes = Closable & FoodDetailRoute
    required init(router: Routes, view: MainScreenViewControllerProtocol?, model: foodModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}
extension MainScreenPresenter: MainScreenPresenterProtocol {
//    func readTest() {
//        // Get a reference to your Firestore database
//        let db = Firestore.firestore()
//        
//        // Assuming you have a collection named "users"
//        // Get a reference to the "users" collection
//        let usersRef = db.collection("foods")
//        
//        // Assuming you have a document named "user1" in the "users" collection
//        // Get a reference to the "user1" document
//        let user1DocRef = usersRef.document("foodsNames")
//        
//        // Fetch data from Firestore
//        user1DocRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let data = document.data()
//                print("Document data: \(data)")
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    func prepareCost(index: IndexPath) -> String {
        return "$ \(String(model.foodCategories[index.section].foods[index.row].price))"
    }
    func prepareCategoriesForCollection(index: IndexPath) -> String {
        return model.foodCategories[index.item].name
    }
    func modelSection(section: Int) -> String {
        return model.foodCategories[section].name
    }
    func modelCountForCollection() -> Int {
        return model.foodCategories.count
    }
    func prepareName(index: IndexPath) -> String {
        return model.foodCategories[index.section].foods[index.row].name
    }
    func modelCountForTableView(section: Int) -> Int {
        return model.foodCategories[section].foods.count
    }
    func openDetailFood() {
        router.openFoodDetail()
    }
    
}
