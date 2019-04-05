//
//  AppDelegate.swift
//  FluidInterfaces
//
//  Created by 黄伯驹 on 2019/4/5.
//  Copyright © 2019 黄伯驹. All rights reserved.
//

import UIKit
import Elephant_Parade

public var preloadedImageCache = [String : UIImage]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIScrollView.initializeParade()
        preloadImages()
        
        return true
    }
    
    func preloadImages() {
        preloadedImageCache["elephant_logo"] = UIImage(named: "elephant_logo")!
        preloadedImageCache["elephant_logo_small"] = UIImage(named: "elephant_logo_small")
        preloadedImageCache["article_image_1"] = UIImage(named: "article_image_1")
        preloadedImageCache["article_image_2"] = UIImage(named: "article_image_2")
        preloadedImageCache["two-image-left"] = UIImage(named: "two-image-left")
        preloadedImageCache["two-image-right"] = UIImage(named: "two-image-right")
        preloadedImageCache["cross_air_1"] = UIImage(named: "cross_air")
        preloadedImageCache["cross_air_2"] = UIImage(named: "cross_air")
        preloadedImageCache["cross_air_3"] = UIImage(named: "cross_air")
        preloadedImageCache["cross_air_4"] = UIImage(named: "cross_air")
    }
}

