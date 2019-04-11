//
//  CountdownProgressBarVC.swift
//  FluidInterfaces
//
//  Created by xiAo_Ju on 2019/4/11.
//  Copyright © 2019 黄伯驹. All rights reserved.
//

import UIKit

class CountdownProgressBarVC: InterfaceViewController {

    let gradient = CAGradientLayer()
    
    // list of array holding 2 colors
    var gradientSet = [[CGColor]]()
    // current gradient index
    var currentGradient: Int = 0
    
    // colors to be added to the set
    let colorOne = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
    let colorTwo = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
    let colorThree = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).cgColor
    
    
    // create outlet in the storyboard with type CountdownProgressBar
    private lazy var countdownProgressBar: CountdownProgressBar = {
        let countdownProgressBar = CountdownProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        countdownProgressBar.translatesAutoresizingMaskIntoConstraints = false
        return countdownProgressBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        view.addSubview(countdownProgressBar)
        countdownProgressBar.widthAnchor.constraint(equalToConstant: 200).isActive = true
        countdownProgressBar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        countdownProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countdownProgressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        createGradientView()
        countdownProgressBar.startCoundown(duration: 10, showPulse: false)
    }
    
    /// Creates gradient view
    
    func createGradientView() {
        
        // overlap the colors and make it 3 sets of colors
        gradientSet.append([colorOne, colorTwo])
        gradientSet.append([colorTwo, colorThree])
        gradientSet.append([colorThree, colorOne])
        
        // set the gradient size to be the entire screen
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        animateGradient()
    }
    
    @objc func handleTap() {
        print("Tapped")
        
        countdownProgressBar.startCoundown(duration: 10, showPulse: true)
    }
    
    func animateGradient() {
        // cycle through all the colors, feel free to add more to the set
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        // animate over 3 seconds
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 3.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.delegate = self
        gradient.add(gradientChangeAnimation, forKey: "gradientChangeAnimation")
    }

}

extension CountdownProgressBarVC: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        // if our gradient animation ended animating, restart the animation by changing the color set
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
}
