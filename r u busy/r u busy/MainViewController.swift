//
//  MainViewController.swift
//  r u busy
//
//  Created by Alex Freitas on 01/12/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var youWereBusyLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(Int.random(in: 1...100))
    }


}

