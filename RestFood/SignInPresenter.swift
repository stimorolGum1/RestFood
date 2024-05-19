//
//  SignInPresenter.swift
//  RestFood
//
//  Created by Danil on 30.01.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreInternal

protocol SignInPresenterProtocol: AnyObject {
    func openMain()
    func openOnboarding()
    func openSignUp()
    func makeSignIn(withEmail: String, password: String)
}

class SignInPresenter {
    
    weak var view: SignInViewControllerProtocol?
    var model: SignInModel!
    let router: Routes
    typealias Routes = Closable & CustomTabBarRouter & OnBoardingRoute & SignUpRoute
    required init(router: Routes, view: SignInViewControllerProtocol?, model: SignInModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    func getUserTokenAndAccessFirestore() {
            // Get current user
            guard let user = Auth.auth().currentUser else {
                print("User not logged in")
                return
            }
            
            // Get user token
            user.getIDToken { (token, error) in
                if let error = error {
                    print("Error getting user token: \(error.localizedDescription)")
                    return
                }
                
                guard let token = token else {
                    print("User token is nil")
                    return
                }
                
                print(token)
                self.readDataFromFirestore(with: token)
            }
        }
    func readDataFromFirestore(with token: String) {
            // Get a reference to your Firestore database
            let db = Firestore.firestore()
            
            // Assuming you have a collection named "foods"
            // Get a reference to the "foods" collection
            let foodsRef = db.collection("foods")
            
            // Fetch data from Firestore using user token
            foodsRef.getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                    return
                }
                
                // Parse the documents
                for document in snapshot!.documents {
                    let data = document.data()
                    print("Document data: \(data)")
                }
            }
        }
}

extension SignInPresenter: SignInPresenterProtocol {
    func makeSignIn(withEmail: String, password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { (user, error) in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
            // User successfully authenticated, now get user token
            self.getUserTokenAndAccessFirestore()
        }
    }
    
    
    
    func openSignUp() {
        router.openSignUp()
    }
    func openMain() {
        router.openCustomTabBar()
    }
    func openOnboarding() {
        router.openOnBoarding()
    }
}
