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




//    @IBOutlet weak var simd: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel?.text = "Data"
        print(type(of: lookAtX[0]))
        print(lookAtX[0])
        print(type(of: distanceL[0]))
        print(distanceL[0])
        print(type(of: distance[0]))
        print(distance[0])
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
