//
//  SettingsVC.swift
//  Hangman
//
//  Created by Veljko Milosevic on 10/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit


class SettingsVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var sound: UISwitch!
    @IBOutlet weak var notification: UISwitch!
    
    
    @IBAction func musicOnOff(_ sender: UISwitch) {
        let state = sender.isOn
        AppSettings.shared.soundOn = state
        tableView.reloadData()
        
    }
    @IBAction func notificationOnOff(_ sender: UISwitch) {
        
    }
    
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.tableFooterView = UIView(frame: .zero)
        updateUI()
    }
    
    
    
    @IBAction func menuButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearStats(_ sender: UIButton) {
        
    }
    
    
    
    
    func updateUI() {
        sound.isOn = AppSettings.shared.soundOn
        sound.onTintColor = AppSettings.shared.themeColor
        notification.onTintColor = AppSettings.shared.themeColor
    }
    
}



extension SettingsVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
