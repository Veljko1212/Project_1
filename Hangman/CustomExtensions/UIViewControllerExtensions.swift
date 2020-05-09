//
//  UIViewControllerExtensions.swift
//  Hangman
//
//  Created by Veljko Milosevic on 09/04/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit


extension UIViewController {
    
    enum AlertType {
        case win
        case lose
        case passed
    }
    
    func setupAlert(type:AlertType, word:Word?, handler:@escaping()-> Void) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        switch type {
        case .win:
            alert.title = "Congratulations"
            alert.message = "Word is : \(word!.title.lowercased().capitalized)"
        case .lose:
            alert.title = "Thats wrong"
            alert.message = "Word is : \(word!.title.lowercased().capitalized)"
        case .passed:
            alert.title = "U have completed all words"
            alert.message = "Go to the categories"
            
        }
        let akcija = UIAlertAction(title: "Next", style: .default) { (_) in
            handler()
        }
        alert.addAction(akcija)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
