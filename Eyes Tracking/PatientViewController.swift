//
//  PatientViewController.swift
//  Eyes Tracking
//
//  Created by Suneeth Keerthy on 4/22/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import Charts

class PatientViewController: UIViewController {

    @IBOutlet weak var lineChart2: LineChartView!
    @IBOutlet weak var lineChart: LineChartView!
    var handle: AuthStateDidChangeListenerHandle?
    var name: String!
    var data: [Dictionary<String, Any>] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        nameTextField.text = ("You tapped the cell at index \(String(describing: name))")
        print(name!)
        dump(self.data)

        // Do any additional setup after loading the view.
    }

    func setChartValues(dataX: [Float], dataY: [Float], distsX: [Float], distsY: [Float]) {

        let valuesX = (0..<(dataX.count - 1)).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: Double(dataX[i]))
        }

        let set1 = LineChartDataSet(entries: valuesX, label: "Difference in X coordinate")
        set1.circleRadius = 0
        set1.setColor(.red)

        let valuesY = (0..<(dataY.count - 1)).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: Double(dataY[i]))
        }

        let set2 = LineChartDataSet(entries: valuesY, label: "Difference in Y coordinate")
        set2.circleRadius = 0
        set2.setColor(.blue)

        let data = LineChartData(dataSets: [set1, set2])

        self.lineChart.data = data

        let values2X = (0..<(distsX.count - 1)).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: Double(distsX[i]))
        }

        let set21 = LineChartDataSet(entries: values2X, label: "Look At X Distance from Square")
        set21.circleRadius = 0
        set21.setColor(.red)

        let values2Y = (0..<(distsY.count - 1)).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: Double(distsY[i]))
        }

        let set22 = LineChartDataSet(entries: values2Y, label: "Look At Y Distancefrom Square")
        set22.circleRadius = 0
        set22.setColor(.blue)

        let data2 = LineChartData(dataSets: [set21, set22])

        self.lineChart2.data = data2


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
//                self.avgX.text = String()


                let db = Firestore.firestore()
                //                var smoothPatients: (Any)? = nil;

                db.collection("doctors").document(email ?? "test@test.com").collection("smooth").document(self.name!).collection("tests").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
//                            print("\(document.documentID) => \(document.data())")
                            print(type(of: document.data()))
                            self.data.append(document.data())
//                            self.patients.append(document.documentID)
                        }
                    }
//                    self.avgX.text = "\(self.data[0]["averageDistanceX"]!)"
//                    self.avgY.text = "\(self.data[0]["averageDistanceY"]!)"
                    let dataX = self.data[0]["diffsX"]
                    let dataY = self.data[0]["diffsY"]
                    let distsX = self.data[0]["distsX"]
                    let distsY = self.data[0]["distsY"]
                    self.setChartValues(dataX: dataX as! [Float], dataY: dataY as! [Float], distsX: distsX as! [Float], distsY: distsY as! [Float])
                }
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
