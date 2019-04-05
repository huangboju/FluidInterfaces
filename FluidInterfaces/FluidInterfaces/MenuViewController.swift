//
//  ViewController.swift
//  FluidInterfaces
//
//  Created by 黄伯驹 on 2019/4/5.
//  Copyright © 2019 黄伯驹. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let interfaces = Interface.all
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.05, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.visibleCells.forEach {
            $0.isHighlighted = false
        }
    }
}

extension MenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isHighlighted = true
        let interface = interfaces[indexPath.section][indexPath.item]
        let viewController = interface.type.init()
        viewController.interface = interface
        show(viewController, sender: nil)
    }
}

extension MenuViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return interfaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interfaces[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterfaceCell.identifier, for: indexPath) as? InterfaceCell else { return UICollectionViewCell() }
        let interface = interfaces[indexPath.section][indexPath.item]
        cell.interface = interface
        return cell
    }
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
    
}

class InterfaceCell: UICollectionViewCell {
    
    public static let identifier = "interfaceCell"
    
    public var interface: Interface? {
        didSet {
            titleLabel.text = interface?.name
            imageView.image = interface?.icon
        }
    }
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        backgroundColor = UIColor.white.withAlphaComponent(0.1)
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = UIColor.white.withAlphaComponent(isHighlighted ? 0.2 : 0.1)
        }
    }
    
}

