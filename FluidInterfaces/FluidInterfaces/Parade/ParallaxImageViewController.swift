//
//  ParallaxImageViewController.swift
//  PDAnimator-Demo
//
//  Created by Anton Doudarev on 3/22/18.
//  Copyright © 2018 ELEPHANT. All rights reserved.
//

import Foundation
import UIKit

public let defaultBlackColor            = UIColor(hex: 0x000000)
public let defaultBackgroundColor       = UIColor(hex: 0x000000)
public let transitioningBackgroundColor = UIColor(hex: 0x050505)

class ParallaxImageViewController : InterfaceViewController {
    
    private let cells: [UICollectionViewCell.Type] = [
        ParallaxIntroCollectionViewCell.self,
        ParallaxScaleCollectionViewCell.self,
        ParallaxDoubleImageCollectionViewCell.self,
        ParallaxImageCollectionViewCell.self,
        ParallaxImageAppearCollectionViewCell.self,
        ParallaxTheEndCollectionViewCell.self
    ]
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        additionalSafeAreaInsets = UIEdgeInsets.zero
        navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.shared.isStatusBarHidden = true
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }

        setupInterface()
    }
    
    func setupInterface()
    {
        view.clipsToBounds = true
        view.backgroundColor = defaultBackgroundColor
        view.addSubview(collectionView)
        
        registerCells()
        
        // Not the most efficient way to layout
        // content, but good enough for a demo
        
        collectionView.frame = view.bounds
    }
    
    lazy var collectionView : UICollectionView = {
        [unowned self] in
        
        let layout = PagingCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = defaultBlackColor
        collectionView.alwaysBounceVertical = false
        collectionView.decelerationRate = UIScrollView.DecelerationRate.normal
        collectionView.delegate = self
        collectionView.bounces = true
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
        }()
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ParallaxImageViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    func registerCells() {
        cells.forEach {
            collectionView.register($0, forCellWithReuseIdentifier: "\($0)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "\(cells[indexPath.row])", for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width : collectionView.bounds.size.width, height : collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
