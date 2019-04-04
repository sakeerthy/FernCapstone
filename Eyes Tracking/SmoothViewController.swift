//
//  SmoothViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 4/4/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit

class SmoothViewController: UIViewController {

    @IBOutlet weak var clickButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clickButton.layer.borderWidth = 0.5
        self.clickButton.layer.borderColor = UIColor.white.cgColor
        self.clickButton.layer.cornerRadius = self.clickButton.frame.height / 4
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
