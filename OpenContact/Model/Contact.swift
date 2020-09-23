//
//  Contact.swift
//  OpenContact
//
//  Created by Caroline Zaini on 23/09/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData

/// On peut rajouter nous-même la class Contact car dans le storyboard on a mis categorie -> Category extension
class Contact: NSManagedObject {
    
    static var all: [Contact] {
        // On récupère nos objets dans la BDD
        // create request :
        /// NSFetchRequest est la classe qui permet au contexte de récupérer des objets à la base de données.
        /// cette instance est dédiée à la récupération d'objets Person
        /// cette méthode fetch Request est générée automatiquement par CoreData dans l'extension Person lors de la création de l'attribut Person
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        /// N.B : NSFetchRequest<Person> est une classe générique
        
        // execute request, ie get the saved data :
        /// On utilise la méthode fetch de NSManagedObjectContext qui renvoie un tableau de Contact. Cette méthode peut renvoyer une erreur donc on utilise try ? et on déballe l'optionnel créé avec un guard let
        guard let contacts = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return contacts
    }
    
}



/// Pour voir si la class récupère bien les propriétés créer dans le fichier xcdatamodel :
//Contact().firstName

/// Lorsqu'on fait jump to definition sur firstName :
//extension Contact {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
//        return NSFetchRequest<Contact>(entityName: "Contact")
//    }
//
//    @NSManaged public var firstName: String?
//    @NSManaged public var lastName: String?
//    @NSManaged public var phone: Int32
//
//}
