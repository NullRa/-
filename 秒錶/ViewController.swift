//
//  ViewController.swift
//  秒錶
//
//  Created by Jay on 2018/10/10.
//  Copyright © 2018年 Radiance Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer=Timer()
    var time : Int = 0
    var isStart :Bool = false
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        timer.invalidate()
        isStart=false
    }
    
    @IBAction func play(_ sender: UIBarButtonItem) {
        
        if !isStart{
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
            timer.fire()
            isStart = true
        }else{
            timer.invalidate()
            isStart=false
        }
        
       
    }
    
    @IBAction func reflash(_ sender: UIBarButtonItem) {
        timer.invalidate()
        isStart=false
        time=0
        timeLable.text=String(0)
    }
    
    @IBOutlet weak var timeLable: UILabel!
    
    @objc func processTimer(){
        time=time+1
        timeLable.text=String(time)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

