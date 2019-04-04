//
//  SelectUserViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 1/31/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController {

    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var doctorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectButton.layer.borderWidth = 0.5
        self.doctorButton.layer.borderWidth = 0.5
        self.selectButton.layer.borderColor = UIColor.white.cgColor
        self.doctorButton.layer.borderColor = UIColor.white.cgColor
        self.selectButton.layer.cornerRadius = self.selectButton.frame.height / 4
        self.doctorButton.layer.cornerRadius = self.selectButton.frame.height / 4
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
