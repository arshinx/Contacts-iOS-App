//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Arshin Jain on 3/30/18.
//  Copyright © 2018 Arshin. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {
    
    var contact: Contact?
    
    // Labels
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // Configures View
    func configureView() {
        
        // Unwrap contact
        guard let contact = contact else { return }
        
        // Update Labels
        phoneLabel.text = contact.phone
    }


    // MARK: - Table view data source


}
