//
//  ContactListController.swift
//  Contacts
//
//  Created by Arshin Jain on 3/30/18.
//  Copyright © 2018 Arshin. All rights reserved.
//

import UIKit

extension Contact {
    
    var firstLetterForSort: String {
        return String(firstName.characters.first!).uppercased()
    }
}

extension ContactsSource {
    
    static var sortedUniqueFirstLetters: [String] {
        let firstLetters = contacts.map { $0.firstLetterForSort }
        let uniqueFirstLetters = Set(firstLetters)
        return Array(uniqueFirstLetters).sorted()
    }
    
    static var sectionedContacts: [[Contact]] {
        
        return sortedUniqueFirstLetters.map { firstLetter in
            let filteredContacts = contacts.filter { $0.firstLetterForSort == firstLetter }
            return filteredContacts.sorted(by: { $0.firstName < $1.firstName })
        }
    }
}

class ContactListController: UITableViewController {
    
    var sections = ContactsSource.sectionedContacts
    let sectionTitles = ContactsSource.sortedUniqueFirstLetters

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }

    // sections = 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // rows = # of contacts
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    // call for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create re-usable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = sections[indexPath.section][indexPath.row]
        
        // Optional - fails silently & gracefully if not permitted
        cell.textLabel?.text = contact.firstName
        cell.detailTextLabel?.text = contact.lastName
        cell.imageView?.image = contact.image
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // height for each cell
    }
    
    // Editor on cell
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Show Contact Segue
        if segue.identifier == "showContact" {
            
            // Unwrap indexpath
            if let indexPath = tableView.indexPathForSelectedRow {
                let contact = sections[indexPath.section][indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let contactDetailController = navigationController.topViewController as? ContactDetailController else { return }
                
                // Assign to contact property
                contactDetailController.contact = contact
            }
        }
    }

}
