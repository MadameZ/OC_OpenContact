//
//  AddContactViewController.swift
//  OpenContact
//
//  Created by Ambroise COLLON on 08/10/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    @IBAction func save() {
        let lastName = lastNameTextField.text
        let firstName = firstNameTextField.text
        let phone = phoneTextField.text

        /// Crée l'entité dans le contexte
        let contact = Contact(context: AppDelegate.viewContext)
        
        /// Donne les valeurs pour les propriétés
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phone = phone

        /// Sauvegarde le context :
        try? AppDelegate.viewContext.save()
        
        navigationController?.popViewController(animated: true)
    }
}

extension AddContactViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if lastNameTextField.isFirstResponder {
            firstNameTextField.becomeFirstResponder()
        } else if firstNameTextField.isFirstResponder {
            phoneTextField.becomeFirstResponder()
        } else {
            save()
        }
        return true
    }

    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        lastNameTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }

}
