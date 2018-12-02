//
//  VideoViewController.swift
//  Eyes Tracking
//
//  Created by Suneeth Keerthy on 11/29/18.
//  Copyright © 2018 Fern Capstone. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {


    @IBOutlet weak var vid: VideoView!

    override func viewDidLoad() {
        super.viewDidLoad()
        vid.configure(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        vid.isLoop = true
        vid.play()
    }
    private func animation(viewAnimation: VideoView) {
        //while(true){
//        for index in 1...100{
            VideoView.animate(withDuration: 10, animations: {
                viewAnimation.frame.origin.x = +viewAnimation.frame.width
            }) { (_) in
                VideoView.animate(withDuration: 10, delay: 1, options: [.curveEaseIn], animations: {
                    viewAnimation.frame.origin.y += viewAnimation.frame.width
                }) { (_) in
                    VideoView.animate(withDuration: 10, delay: 1, options: [.curveEaseIn], animations: {
                        viewAnimation.frame.origin.x -= viewAnimation.frame.width
                    }) { (_) in
                        VideoView.animate(withDuration: 10, delay: 1, options: [.curveEaseIn], animations: {
                            viewAnimation.frame.origin.y -= viewAnimation.frame.width
                        })
                    }
                }
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 43.0, execute: {
            self.animation(viewAnimation: self.vid)
        })
//        }
        //animation(viewAnimation: vid)
    }

    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        animation(viewAnimation: vid)
//        let track = 0
//        print("yolo")
//        vid.frame.origin=(CGPoint(x:0,y:0))
//        var x = 0
//        if (track == 0) {
//            for index in 1...100{
////                x = x + 1
////                vid.frame.origin=(CGPoint(x:x,y:0))
//                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
//                    // Put your code which should be executed with a delay here
//                    x = x + 1
//                    self.vid.frame.origin=(CGPoint(x:x,y:0))
//                })
//            }
//        }


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
