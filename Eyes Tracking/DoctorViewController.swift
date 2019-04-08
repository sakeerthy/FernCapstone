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

class DoctorViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func login(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) {(user, error) in
            print(user)
            if (user != nil) {
                self.performSegue(withIdentifier: "login", sender: self)
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
