//
//  APIManager.swift
//  InnerworksExam
//
//  Created by Joyce Ariola on 01/12/2020.
//  Copyright © 2020 Joyce Ariola. All rights reserved.
//

import UIKit

class APIManager {
    
    static let sharedInstance = APIManager()
    
    func getHeroes(onSuccess: @escaping(HeroArray?) -> Void, onFailure: @escaping(Error) -> Void) {
        let url : String = Network.BaseURL + Network.MarvelHeroes
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = RequestType.Get.key
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as?  Array<Any>
                    print(json as Any)
                    let result = HeroArray(array: json)
                    onSuccess(result)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }
        })
        task.resume()
    }
}

