//
//  PostViewController.swift
//  Eyes Tracking
//
//  Created by Suneeth Keerthy on 12/2/18.
//  Copyright © 2018 Fern Capstone. All rights reserved.
//

import UIKit
import ARKit
import Firebase
import FirebaseFirestore

class PostViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var username:String = ""
    var leftData:[simd_float4x4] = []
    var rightData:[simd_float4x4] = []
    var leftX: [CGFloat] = []
    var leftY: [CGFloat] = []
    var rightX: [CGFloat] = []
    var rightY: [CGFloat] = []
    var lookAtX: [Any] = []
    var lookAtY: [Any] = []
    var distanceL: [Any] = []
    var distanceR: [Any] = []
    var distance: [Any] = []

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
    
    func simdTransform(left_simd: [simd_float4x4], right_simd: [simd_float4x4], reference: DocumentReference) -> Void {
        var counter = -1
        for element in left_simd {
            counter += 1
            let left_name = "left" + String(counter)
            for index in 0...3 {
                var col = "col" + String(index)
                reference.collection("simd").document(left_name).setData([col: [element[index, 0], element[index, 1], element[index, 2], element[index, 3],]], merge: true)              }
        }
        counter = -1
        for element in right_simd {
            counter += 1
            let right_name = "right" + String(counter)
            for index in 0...3 {
                var col = "col" + String(index)
                
                
                reference.collection("simd").document(right_name).setData([col: [element[index, 0], element[index, 1], element[index, 2], element[index, 3],]], merge: true)
            }
        }
        
        
    }

    
    
//    @IBOutlet weak var simd: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel?.text = "Data"
//        print(type(of: lookAtX[0]))
//        print(lookAtX[0])
//        print(type(of: distanceL[0]))
//        print(distanceL[0])
//        print(type(of: distance[0]))
//        print(distance[0])
        
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection("data").addDocument(data: [
            "patientName": dummyPatient,
            "leftX": leftDummyX,
            "leftY": leftDummyY,
            "rightX": rightDummyX,
            "rightY": rightDummyY,
            "lookAtX": lookAtDummyX,
            "lookAtY": lookAtDummyY,
            "distanceL": distanceDummyL,
            "distanceR": distanceDummyR,
            "distance": distanceDummy,
            //            "leftData": leftDummyData,
            //            "rightdata": rightDummyData,
        ])
        let uuid = NSUUID().uuidString
        let docRef = db.collection("patients").document(dummyPatient).collection("tests").document("smooth").setData([
            uuid: ref], merge: true)
        
        simdTransform(left_simd: leftDummyData, right_simd: rightDummyData, reference: (ref ?? nil)!)
        
        
//        db.collection("patients").document(dummyPatient).collection("tests").document(ref)
        
        
        
        
//        print("hi")
//        docRef.getDocument { (document, error) in
//            if var document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
////                let newDoc = document.get("tests").data().append(ref)
////                db.collection("patients").document(dummyPatient).addDocument(data: [
////                    "tests": newDoc])
////                print(document.get("tests"))
//                var doc = document.data()
//                print(doc)
////                print(dataDescription)
//                print("hi2")
//            } else {
//                print("Document does not exist")
//            }
//        }
        

//        db.collection("patients").document(dummyPatient).collection("tests").addDocument(data: [: ref])
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
