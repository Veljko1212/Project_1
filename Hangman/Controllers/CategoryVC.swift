//
//  CategoryViewController.swift
//  Hangman
//
//  Created by Veljko Milosevic on 06/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    let cellIdentifier = "CollectionViewCell"
    var selectedStrategy:GuessingStrategy!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    
    @IBAction func menuButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            if let gameVC = segue.destination as? GameVC {
                if let normalStragy = selectedStrategy as? NormalStrategy {
                    gameVC.gameStrategy = normalStragy
                }
            }
        }
    }
    
}


extension CategoryVC: UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameStorage.shared.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        let group = GameStorage.shared.categories[indexPath.row]
        
        cell.imageView.image = UIImage(data: group.image!)
        cell.title.text = group.name
        
        return cell
    }
    
}

extension CategoryVC: UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = GameStorage.shared.getCategoryFromCategoryCD(indexPath: indexPath)
        
        let alert = UIAlertController(title: "Chose difficulty", message: "", preferredStyle: .alert)
        let normal = UIAlertAction(title: "Normal", style: .default) { (_) in
            
            self.selectedStrategy = NormalStrategy(category: category)
            self.performSegue(withIdentifier: "toGame", sender: nil)
        }
        alert.addAction(normal)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

extension CategoryVC: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
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
    
}
