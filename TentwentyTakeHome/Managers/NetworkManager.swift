//
//  NetworkManager.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

struct NetworkManager{
    static let shared = NetworkManager()

    private let baseURL = URL(string: "https://api.themoviedb.org/3/movie/")!

    
    
    // MARK: Private Functions
    private func buildRequestGet(path: String,  params: [(String, String)]) -> Observable<Data>{
        let request : Observable<URLRequest> = Observable.create { (observer) -> Disposable in
            
            let url = self.baseURL.appendingPathComponent(path)
            var request = URLRequest(url: url)
            let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: true)!
            
            
            let queryItems = params.map { URLQueryItem(name: $0.0, value: $0.1) }
            urlComponents.queryItems = queryItems
            
            request.url = urlComponents.url!
            request.httpMethod = "GET"
            
            observer.onNext(request)
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        let session = URLSession.shared
        
        return request.flatMap { (request)  in
            return session.rx.response(request: request)
                .map{ response, data in
                    switch response.statusCode {
                    case 200 ..< 300:
                        return data
                    default:
                        throw NetworkError.unableToComplete
                    }
                }
        }
        
    }
    
}
