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
    var test:String = ""
    var leftData:[simd_float4x4] = []
    var rightData:[simd_float4x4] = []
    var leftX: [CGFloat] = []
    var leftY: [CGFloat] = []
    var rightX: [CGFloat] = []
    var rightY: [CGFloat] = []
    var lookAtX: [CGFloat] = []
    var lookAtY: [CGFloat] = []
    var distanceL: [Any] = []
    var distanceR: [Any] = []
    var distance: [Any] = []
    var squareX: [CGFloat] = []
    var squareY: [CGFloat] = []
    var isSmoothTest: Bool = true
    var patientName: String = ""
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

    func getAverageDistance() -> (Float, Float) {
        print(squareX)
        print(squareY)
        let len = lookAtX.count
        let x = len % 4
        print(x)
        let new_len = len - x
        let n = new_len/4
        let distanceX = squareX[1] - squareX[0]
        let distanceY = squareY[2] - squareY[1]

        var count = 0
        var sqsX: [Float] = []
        var sqsY: [Float] = []

        let deltaX = Float(distanceX)/Float(n)
        let deltaY = Float(distanceY)/Float(n)

        for sqX in squareX {
            for i in 1...n {
                if (count == 0) {
                    sqsX.append(Float(squareX[0]) + (Float(i - 1) * deltaX))
                    sqsY.append(Float(squareY[0]))

                }
                else if (count == 1) {
                    sqsX.append(Float(squareX[1]))
                    sqsY.append(Float(squareY[1]) + (Float(i - 1) * deltaY))

                }
                else if (count == 2) {
                    sqsX.append(Float(squareX[1]) - (Float(i - 1) * deltaX))
                    sqsY.append(Float(squareY[2]))
                }
                else if (count == 3) {
                    sqsX.append(Float(squareX[0]))
                    sqsY.append(Float(squareY[3]) - (Float(i - 1) * deltaY))

                }
            }
            count = count + 1
        }

        print(sqsX)
        print(sqsX.count)
        print(sqsY)

        print(sqsY.count)
        print(len)
        print(new_len)

        var diffsX: [Float] = []
        var diffsY: [Float] = []

        for k in 0...new_len-1 {
            diffsX.append(abs(Float(abs(Float(sqsX[k])) - abs(Float(lookAtX[k])))))
            diffsY.append(abs(abs(Float(sqsY[k])) - abs(Float(lookAtY[k]))))
        }
        print(diffsX)
        print(diffsY)
        let sumArrayX = diffsX.reduce(0, +)
        let sumArrayY = diffsY.reduce(0, +)

        print(sumArrayX/Float(new_len))
        print(sumArrayY/Float(new_len))
        return (sumArrayX/Float(new_len), sumArrayY/Float(new_len))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel?.text = "Data"
        //        print(type(of: lookAtX[0]))
        //        print(lookAtX[0])
        //        print(type(of: distanceL[0]))
        //        print(distanceL[0])
        //        print(type(of: distance[0]))
        //        print(distance[0])
        let (averageDistanceX, averageDistanceY) = getAverageDistance()

        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection("data").addDocument(data: [
            "patientName": patientName,
            "leftX": leftDummyX,
            "leftY": leftDummyY,
            "rightX": rightDummyX,
            "rightY": rightDummyY,
            "lookAtX": lookAtDummyX,
            "lookAtY": lookAtDummyY,
            "distanceL": distanceDummyL,
            "distanceR": distanceDummyR,
            "distance": distanceDummy,
            "averageDistanceX": averageDistanceX,
            "averageDistanceY": averageDistanceY,


            //            "leftData": leftDummyData,
            //            "rightdata": rightDummyData,
            ])
        let uuid = NSUUID().uuidString
        
        // check test
        if isSmoothTest {
            test = "smooth"
        } else {
            test = "saccadic"
        }
        
        let docRef = db.collection("patients").document(patientName).collection("tests").document(test).setData([
            uuid: ref], merge: true)
        
        simdTransform(left_simd: leftDummyData, right_simd: rightDummyData, reference: (ref ?? nil)!)
        
        print(squareX)
        print(squareY)
        let len = lookAtX.count
        let x = len % 4
        print(x)
        let new_len = len - x
        let n = new_len/4
        let distanceX = squareX[1] - squareX[0]
        let distanceY = squareY[2] - squareY[1]

        var count = 0
        var sqsX: [Float] = []
        var sqsY: [Float] = []

        let deltaX = Float(distanceX)/Float(n)
        let deltaY = Float(distanceY)/Float(n)

        for sqX in squareX {
            for i in 1...n {
                if (count == 0) {
                    sqsX.append(Float(squareX[0]) + (Float(i - 1) * deltaX))
                    sqsY.append(Float(squareY[0]))

                }
                else if (count == 1) {
                    sqsX.append(Float(squareX[1]))
                    sqsY.append(Float(squareY[1]) + (Float(i - 1) * deltaY))

                }
                else if (count == 2) {
                    sqsX.append(Float(squareX[1]) - (Float(i - 1) * deltaX))
                    sqsY.append(Float(squareY[2]))
                }
                else if (count == 3) {
                    sqsX.append(Float(squareX[0]))
                    sqsY.append(Float(squareY[3]) - (Float(i - 1) * deltaY))

                }
            }
            count = count + 1
        }

        print(sqsX)
        print(sqsX.count)
        print(sqsY)

        print(sqsY.count)
        print(len)
        print(new_len)

        var diffsX: [Float] = []
        var diffsY: [Float] = []

        for k in 0...new_len-1 {
            diffsX.append(abs(Float(abs(Float(sqsX[k])) - abs(Float(lookAtX[k])))))
            diffsY.append(abs(abs(Float(sqsY[k])) - abs(Float(lookAtY[k]))))
        }
        print(diffsX)
        print(diffsY)
        let sumArrayX = diffsX.reduce(0, +)
        let sumArrayY = diffsY.reduce(0, +)

        print(sumArrayX/Float(new_len))
        print(sumArrayY/Float(new_len))

//        for i in 0...new_len-1 {
//            print("Look at: " + String(Float(lookAtX[i])) + " | Square: " + String(sqsX[i]))
//        }
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

