//
//  SelectAssessmentViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 1/31/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SelectAssessmentViewController: UIViewController {

    @IBOutlet weak var saccButton: UIButton!
    @IBOutlet weak var smoothButton: UIButton!
    var handle: AuthStateDidChangeListenerHandle?
    var patientName: String = ""

    override func viewDidAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SmoothViewController
        {
            let vc = segue.destination as? SmoothViewController
            vc?.patientName = patientName
        }
        if segue.destination is SaccadeViewController
        {
            let vc = segue.destination as? SaccadeViewController
            vc?.patientName = patientName
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.saccButton.layer.borderWidth = 0.5
        self.smoothButton.layer.borderWidth = 0.5
        self.saccButton.layer.borderColor = UIColor.white.cgColor
        self.smoothButton.layer.borderColor = UIColor.white.cgColor
        self.saccButton.layer.cornerRadius = self.saccButton.frame.height / 4
        self.smoothButton.layer.cornerRadius = self.smoothButton.frame.height / 4
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
