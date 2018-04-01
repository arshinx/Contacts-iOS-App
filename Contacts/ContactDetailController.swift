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
    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configures view
        configureView()
    }
    
    // Configures View
    func configureView() {
        
        // Unwrap contact
        guard let contact = contact else { return }
        
        // Update Labels
        profileView.image = contact.image
        nameLabel.text = contact.firstName + " " + contact.lastName
        
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
        streetLabel.text = contact.street
        cityLabel.text = contact.city
        stateLabel.text = contact.state
        zipLabel.text = contact.zip
    }


    // MARK: - Table view data source


}
