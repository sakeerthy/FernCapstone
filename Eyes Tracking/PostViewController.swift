//
//  PostViewController.swift
//  Eyes Tracking
//
//  Created by Suneeth Keerthy on 12/2/18.
//  Copyright © 2018 Fern Capstone. All rights reserved.
//

import UIKit
import ARKit

class PostViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var username:String = ""
//    var leftData:[simd_float4x4] = []
//    var stringData:[String] = []
    //var leftData:[simd_float4x4] = []

//    @IBOutlet weak var simd: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel?.text = "Data"
    }
//        dump(leftData)
//        print(String(leftData[0][0][0]))
//        for data in leftData {
//            for col in 0...3 {
//                for row in 0...3 {
//                    print(String(data[col][row]), terminator:" ")
//                }
//                print("")
//            }
//            print("")
//        }
//
//        tableView.delegate = self as? UITableViewDelegate
//        tableView.dataSource = self as? UITableViewDataSource
//        // Do any additional setup after loading the view.
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Data"
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Create an object of the dynamic cell "PlainCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
//        // Depending on the section, fill the textLabel with the relevant text
//        // Fruit Section
//        cell.textLabel?.text = "hi"
//
//
//        // Return the configured cell
//        return cell
//
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
