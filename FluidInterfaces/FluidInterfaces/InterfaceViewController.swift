//
//  InterfaceViewController.swift
//  FluidInterfaces
//
//  Created by Nathan Gitter on 7/8/18.
//  Copyright © 2018 Nathan Gitter. All rights reserved.
//

import UIKit
import SafariServices

/// Base class for all interface view controllers.
class InterfaceViewController: UIViewController {
    
    var interface: Interface? {
        didSet {
            title = interface?.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.05, alpha: 1) // reduces screen tearing on iPhone X
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(openSafari))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = interface?.color
    }
    
    @objc
    func openSafari() {
        guard let interface = interface else { return }
        present(SFSafariViewController(url: URL(string: interface.link)!), animated: true, completion: nil)
    }
}
