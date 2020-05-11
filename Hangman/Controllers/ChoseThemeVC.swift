//
//  ChoseThemeViewController.swift
//  Hangman
//
//  Created by Veljko Milosevic on 10/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class ChoseThemeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var colors = [#colorLiteral(red: 0.666592598, green: 0.6667093039, blue: 0.666585207, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "ColorViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "ColorViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.hidesBackButton = true
    }
    
    
}

extension ChoseThemeVC :UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorViewCell", for: indexPath) as! ColorViewCell
        
        cell.imageView.tintColor = colors[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 0
        
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            let yourHeight = collectionView.bounds.height / 5.0 - 10
            let yourWidth = collectionView.bounds.width / 3.0 - 10
            return CGSize(width: yourWidth, height: yourHeight)
        }
        else {
            let yourHeight = collectionView.bounds.height / 6.0 - 10
            let yourWidth = collectionView.bounds.width / 3.0 - 10
            return CGSize(width: yourWidth, height: yourHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AppSettings.shared.themeColor = colors[indexPath.row]
        navigationController?.popViewController(animated: true)
        
    }
    
}
