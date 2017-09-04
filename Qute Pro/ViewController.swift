//
//  ViewController.swift
//  Qute Pro
//
//  Created by Hirad on 2017-08-30.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var test: UIImageView!
    let photo = Photo()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let quote = Quote()
        photo.startPhotoFech()
        self.test.image = photo.myPhoto
        quote.getSearchResults(completion: { () in
            
            DispatchQueue.main.async {
                self.quoteLabel.text = quote.mainText
                print("!!!!",quote.mainText)

            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func search(_ sender: Any) {
        
        let quote = Quote()
        search.isHidden = true
        search.isEnabled = false
       // let photo = Photo()
        self.photo.startPhotoFech()
       // photo.startPhotoFech()
        self.test.image = self.photo.myPhoto
        quote.getSearchResults(completion: { () in
            
     
            
            DispatchQueue.main.async {
                self.quoteLabel.text = quote.mainText
                print("!!!!",quote.mainText)
                self.search.isHidden = false
                self.search.isEnabled = true
                
                
            }
            
        })
        
    }
}

