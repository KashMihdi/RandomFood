//
//  SecondViewController.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 27.04.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    var str: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = str
    }
}
