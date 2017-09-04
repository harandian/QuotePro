//
//  Photo.swift
//  Qute Pro
//
//  Created by Hirad on 2017-08-30.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    var myPhoto = UIImage()
    
    
    func startPhotoFech() {
        
        print("Begin of code")
        if let checkedUrl = URL(string: "https://lorempixel.com/200/300/nature") {
            //imageView.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                
                if let testimage = UIImage(data: data) {
                    self.myPhoto = testimage
                }
            }
        }
        
        
    }
}
