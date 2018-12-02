//
//  HomeViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 11/28/18.
//  Copyright © 2018 virakri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController  {
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var instruc: UITextView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var beginBtn: UIButton!


    // button action if click perform segue

    @IBAction func beginBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.logo.alpha = 0.0
            self.desc.alpha = 0.0
            self.beginBtn.alpha = 0.0
        })
        { (finished) in
            UIView.animate(withDuration: 0.5, animations: {
                self.instruc.alpha = 1.0
            })
            { (finished) in
                UIView.animate(withDuration: 0.5, delay: 1.5, animations: {
                    self.start.alpha = 1.0
                })
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.instruc.alpha = 0.0
        self.start.alpha = 0.0
        // Do any additional setup after loading the view.
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
