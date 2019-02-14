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
    var leftData:[simd_float4x4] = []
    var rightData:[simd_float4x4] = []

//    @IBOutlet weak var simd: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel?.text = "Data"
        dump(leftData)
        dump(rightData)
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
