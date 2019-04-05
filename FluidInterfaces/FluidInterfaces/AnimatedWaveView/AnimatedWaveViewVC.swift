//
//  AnimatedWaveViewVC.swift
//  FluidInterfaces
//
//  Created by 黄伯驹 on 2019/4/5.
//  Copyright © 2019 黄伯驹. All rights reserved.
//

import UIKit

class AnimatedWaveViewVC: InterfaceViewController {

    var waveView: AnimatedWaveView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        buildWaveView()
    }
    
    func buildWaveView() {
        let animatedWaveView = AnimatedWaveView(frame: self.view.bounds)
        self.view.addSubview(animatedWaveView)
        waveView = animatedWaveView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        waveView?.makeWaves()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
