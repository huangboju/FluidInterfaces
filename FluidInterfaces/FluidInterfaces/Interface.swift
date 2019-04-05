//
//  Interface.swift
//  FluidInterfaces
//
//  Created by Nathan Gitter on 7/8/18.
//  Copyright © 2018 Nathan Gitter. All rights reserved.
//

import UIKit

struct Interface {
    var name: String
    var icon: UIImage
    var color: UIColor
    var type: InterfaceViewController.Type
    var link: String
}

extension Interface {
    
    public static var all: [[Interface]] {
        return [
            [
            Interface(name: "Calculator button", icon: #imageLiteral(resourceName: "icon_calc"), color: UIColor(hex: 0x999999), type: CalculatorButtonInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "Spring animations", icon: #imageLiteral(resourceName: "icon_spring"), color: UIColor(hex: 0x64CCF7), type: SpringInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "Flashlight button", icon: #imageLiteral(resourceName: "icon_flash"), color: UIColor(hex: 0xEDEDED), type: FlashlightButtonInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "Rubberbanding", icon: #imageLiteral(resourceName: "icon_rubber"), color: UIColor(hex: 0xFF5B50), type: RubberbandingInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "Acceleration pausing", icon: #imageLiteral(resourceName: "icon_acceleration"), color: UIColor(hex: 0x64FF8F), type: AccelerationInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "Rewarding momentum", icon: #imageLiteral(resourceName: "icon_momentum"), color: UIColor(hex: 0x73B2FF), type: MomentumInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "FaceTime PiP", icon: #imageLiteral(resourceName: "icon_pip"), color: UIColor(hex: 0xF2F23A), type: PipInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            Interface(name: "Rotation", icon: #imageLiteral(resourceName: "icon_rotation"), color: UIColor(hex: 0xFF28A5), type: RotationInterfaceViewController.self, link: "https://github.com/nathangitter/fluid-interfaces"),
            ],
            [
            Interface(name: "AnimatedWaveView", icon: #imageLiteral(resourceName: "icon_rotation"), color: UIColor(hex: 0xFF28A5), type: AnimatedWaveViewVC.self, link: "https://github.com/j-wilkin/AnimatedWaveView"),
            Interface(name: "AppleWatchBreathe", icon: #imageLiteral(resourceName: "icon_rotation"), color: UIColor(hex: 0xFF28A5), type: AppleWatchBreatheVC.self, link: "https://juejin.im/post/5c8ef41ef265da682335e688")
            ]
        ]
    }
    
}
