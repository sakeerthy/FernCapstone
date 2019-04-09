//
//  LoginViewController.swift
//  Eyes Tracking
//
//  Created by Suneeth Keerthy on 4/8/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit
import FirebaseAuth
import ARKit
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController {
    var test:String = ""
    var isSmoothTest: Bool = false
    var handle: AuthStateDidChangeListenerHandle?
    var dummyPatient = "Karen Panetta"
    var dummyDoctor = "Mingles Chowder"
    var leftDummyData:[simd_float4x4] = [simd_float4x4([[0.9996633, -0.0025119425, 0.025826829, 0.0], [0.0, 0.99530345, 0.09680419, 0.0], [-0.025948698, -0.09677159, 0.99496835, 0.0], [0.03208242, 0.027041169, 0.02522561, 1.0]]), simd_float4x4([[0.9996633, -0.0025119425, 0.025826829, 0.0], [0.0, 0.99530345, 0.09680419, 0.0], [-0.025948698, -0.09677159, 0.99496835, 0.0], [0.03208242, 0.027041169, 0.02522561, 1.0]])]

    var rightDummyData:[simd_float4x4] = [simd_float4x4([[0.9996633, -0.0025119425, 0.025826829, 0.0], [0.0, 0.99530345, 0.09680419, 0.0], [-0.025948698, -0.09677159, 0.99496835, 0.0], [0.03208242, 0.027041169, 0.02522561, 1.0]]), simd_float4x4([[0.9996633, -0.0025119425, 0.025826829, 0.0], [0.0, 0.99530345, 0.09680419, 0.0], [-0.025948698, -0.09677159, 0.99496835, 0.0], [0.03208242, 0.027041169, 0.02522561, 1.0]])]
    var leftDummyX: [CGFloat] = [CGFloat(534.6474716905911), CGFloat(0.0)]
    var leftDummyY: [CGFloat] = [CGFloat(0.0), CGFloat(534.6474716905911)]
    var rightDummyX: [CGFloat] = [CGFloat(34.6474716905911), CGFloat(0.0)]
    var rightDummyY: [CGFloat] = [CGFloat(0.0), CGFloat(34.6474716905911)]
    var lookAtDummyX: [CGFloat] = [CGFloat(114.0807662788729), CGFloat(0.0)]
    var lookAtDummyY: [CGFloat] = [CGFloat(0.0), CGFloat(114.0807662788729)]
    var distanceDummyL: [Float] = [0.374566, 0.3792225]
    var distanceDummyR: [Float] = [0.374566, 0.3792225]
    var distanceDummy: [Float] = [0.374566, 0.3792225]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if let user = user {
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
                // ...
                print(uid)
                print(email)
                print(photoURL)


                let db = Firestore.firestore()

                var ref: DocumentReference? = nil
                ref = db.collection("data").addDocument(data: [
                    "patientName": self.dummyPatient,
                    "leftX": self.leftDummyX,
                    "leftY": self.leftDummyY,
                    "rightX": self.rightDummyX,
                    "rightY": self.rightDummyY,
                    "lookAtX": self.lookAtDummyX,
                    "lookAtY": self.lookAtDummyY,
                    "distanceL": self.distanceDummyL,
                    "distanceR": self.distanceDummyR,
                    "distance": self.distanceDummy,
                    //            "leftData": leftDummyData,
                    //            "rightdata": rightDummyData,
                    ])
                let uuid = NSUUID().uuidString

                if self.isSmoothTest {
                    self.test = "smooth"
                } else {
                    self.test = "saccadic"
                }

                let docRef = db.collection("doctors").document(email ?? "none").collection("tests").document(self.test).setData([
                    uuid: ref], merge: true)

                let testRef = db.collection("doctors").document(email ?? "none").collection("data").document(self.test).collection(self.dummyPatient).addDocument(data:[
                    "patientName": self.dummyPatient,
                    "leftX": self.leftDummyX,
                    "leftY": self.leftDummyY,
                    "rightX": self.rightDummyX,
                    "rightY": self.rightDummyY,
                    "lookAtX": self.lookAtDummyX,
                    "lookAtY": self.lookAtDummyY,
                    "distanceL": self.distanceDummyL,
                    "distanceR": self.distanceDummyR,
                    "distance": self.distanceDummy,
                    //            "leftData": leftDummyData,
                    //            "rightdata": rightDummyData,
                    ])
//                let docRef2 = db.collection("doctors").document(email ?? "none").collection("data")

//                var references: [Any] = []
//                docRef2.getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        for document in querySnapshot!.documents {
//                            references.append(document.data())
//                        }
//                        print(references[0])
//                    }
//                }



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
