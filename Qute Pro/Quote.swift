//
//  Quote.swift
//  Qute Pro
//
//  Created by Hirad on 2017-08-30.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var mainText = String()
    var author = String()
    
    
    //    init(withText:String, andAuthor:String) {
    //        mainText = withText
    //        author = andAuthor
    //    }
    
    
    
    
    let mysession = URLSession (configuration: .default)
    var dataTask: URLSessionDataTask?
    
    
    func getSearchResults() {
        
        //dataTask?.cancel()
        
        let myUrl = URL(string:"https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        
        dataTask = mysession.dataTask(with: myUrl, completionHandler: { (data, response, error) in
            
            defer { self.dataTask = nil }
            
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data,
                let response = response as? HTTPURLResponse {
                print("This is your data",data,response.statusCode)
                var json:Any!
                do { json = try JSONSerialization.jsonObject(with: data) }
                catch { print(error) }
                
                if let myDictionary = json as? [String: Any] {
                    
                    if let tempText = myDictionary["quoteText"] as? String {
                        self.mainText = tempText
                        print("the quote text:",self.mainText)
                    }
                    
                    if let tempText = myDictionary["quoteAuthor"] as? String {
                        self.author = tempText
                        print("the quote autor is:", self.author)
                    }
                    
                }
                //  self.setUpQute(webQuote: json)
                
                print(json)
                
                
            }
            
        })
        
        dataTask?.resume()
    }
    
    //    func setUpQute(webQuote: Dictionary) {
    //
    //        self.mainText = webQuote[value(forKey: "quoteText")]
    //
    //    }
}
