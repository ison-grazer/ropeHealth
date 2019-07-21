//
//  ViewController.swift
//  ropeHealth
//
//  Created by Isabella Fransson on 2019-07-11.
//  Copyright © 2019 Isabella Fransson. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var buttonContainer: UIImageView!
    @IBOutlet weak var statsBtn: UIButton!
    @IBOutlet weak var newRopeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonContainer.layer.cornerRadius = 20 //rounds corners
        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func statsPressed(_ sender: Any) {
    }
    
    @IBAction func newRopePressed(_ sender: Any) {
    }

}

