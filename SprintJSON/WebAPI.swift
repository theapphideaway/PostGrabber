//
//  WebAPI.swift
//  SprintJSON
//
//  Created by Ian Schoenrock on 3/7/19.
//  Copyright © 2019 Ian Schoenrock. All rights reserved.
//

import Foundation
import Alamofire

class WebAPI {
    
    func getTestAPI(completed:@escaping (_ posts: [Post])->Void){
        guard let testUrl = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        Alamofire.request(testUrl, method: .get).responseJSON {
            (response) in
            
            print(response)
            if response.result.isSuccess {

                guard let data = response.data else {return}

                do{
                    let myResponse = try JSONDecoder().decode([Post].self, from: data)
                    
                    completed(myResponse)
                    
                }
                catch{}
            }
        }
    }
}

struct Post: Codable{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
