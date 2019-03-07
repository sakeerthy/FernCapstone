//
//  PatientInfoViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 1/31/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit


class PatientInfoViewController: UIViewController {

    @IBOutlet weak var PatientTextField: UITextField!
    
    @IBOutlet weak var DoctorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DoctorTextField.delegate = self as? UITextFieldDelegate
        print(PatientTextField)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
