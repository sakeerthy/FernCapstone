//
//  SaccadeViewController.swift
//  Eyes Tracking
//
//  Created by Romy Aboudarham on 3/6/19.
//  Copyright © 2019 Fern Capstone. All rights reserved.
//

import UIKit

class SaccadeViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var instruc: UITextView!
    
    @IBAction func beginPressed(_ sender: UIButton) {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.isSmooth = false
        }
    }
    
}

