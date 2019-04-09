//
//  SmoothViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 4/4/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit

class SmoothViewController: UIViewController {
    var patientName: String = ""

    @IBOutlet weak var clickButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clickButton.layer.borderWidth = 0.5
        self.clickButton.layer.borderColor = UIColor.white.cgColor
        self.clickButton.layer.cornerRadius = self.clickButton.frame.height / 4
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.isSmooth = true
            vc?.patientName = self.patientName
        }
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
