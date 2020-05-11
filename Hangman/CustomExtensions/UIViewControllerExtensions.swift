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
    
    func setupSetWordAlert(handler:@escaping(String)->Void){
        let alert = UIAlertController(title: "Insert the word to guess", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.becomeFirstResponder()
            textField.keyboardType = .namePhonePad
        }
        
        alert.addAction(UIAlertAction(title: "Next", style: .default, handler: { (button) in
            guard let word = alert.textFields?.first?.text , word != "" else {
                self.navigationController?.popViewController(animated: true)                
                return
            }
            handler(word)
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func clearStatssetupAlert(handler:@escaping()->Void) {
        let alert = UIAlertController(title: "Are u sure u want clear stats?", message: "This action cannot be undo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (_) in
            handler()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
