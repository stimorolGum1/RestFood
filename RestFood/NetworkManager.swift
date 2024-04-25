//
//  NetworkManager.swift
//  RestFood
//
//  Created by Danil on 18.04.2024.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol: AnyObject {
    func makeRequest(email: String, pass: String, url: String, completion: @escaping ((Result<Void, Error>)) -> Void)
    func getURL(link: String) -> String
}

class NetworkManager: NetworkManagerProtocol {
    static let net = NetworkManager()
    
    func getURL(link: String) -> String {
        let info = Bundle.main.infoDictionary?["URLs"] as? [String: Any] ?? ["":""]
        let url = info[link] as? String ?? ""
        let apikey = Bundle.main.infoDictionary?["APIkey"] as? String ?? ""
        return url + apikey
    }
    
    func makeRequest(email: String, pass: String, url: String, completion: @escaping (Result<Void, Error>) -> Void) { //поставить результат в комплишен и не ошибку
        let url = getURL(link: url)
        let parameters = ["email": email,
                          "password": pass,
                          "returnSecureToken": true] as [String : Any]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default) { $0.timeoutInterval = 3 }
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
}
