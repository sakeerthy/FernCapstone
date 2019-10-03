//
//  DoctorViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 4/4/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class DoctorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var login: UIButton!

    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailField.delegate = self
        self.passwordField.delegate = self

        self.login.layer.borderWidth = 0.5
        self.login.layer.borderColor = UIColor.white.cgColor
        self.login.layer.cornerRadius = self.login.frame.height / 4

        let db = Firestore.firestore()

        var docs: [Any] = []

        db.collection("data").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    docs.append(document.data())
                    //                    print("\(document.documentID) => \(document.data())")
                }
                print(docs.count)
            }
        }
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func login(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) {(user, error) in
            print(user)
            if (user != nil) {
                self.performSegue(withIdentifier: "start", sender: self)
            }
            else
            {
                let alert = UIAlertController(title: "There was a problem", message: nil, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
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
