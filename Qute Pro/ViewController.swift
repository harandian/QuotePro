//
//  ViewController.swift
//  Qute Pro
//
//  Created by Hirad on 2017-08-30.
//  Copyright © 2017 Hirad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let quote = Quote()
        quote.getSearchResults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

