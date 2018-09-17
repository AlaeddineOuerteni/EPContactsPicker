//
//  EPContact.swift
//  EPContacts
//
//  Created by Prabaharan Elangovan on 13/10/15.
//  Copyright © 2015 Prabaharan Elangovan. All rights reserved.
//

import UIKit
import Contacts

open class EPContact {
    
    open var firstName: String
    open var lastName: String
    open var thumbnailProfileImage: UIImage?
    open var profileImage: UIImage?
    open var contactId: String?
    open var phoneNumber: String
    
    public init (contact: CNContact, phoneNumber: CNLabeledValue<CNPhoneNumber>) {
        self.firstName = contact.givenName
        self.lastName = contact.familyName
        self.contactId = contact.identifier
        
        if let thumbnailImageData = contact.thumbnailImageData {
            self.thumbnailProfileImage = UIImage(data: thumbnailImageData)
        }
        
        if let imageData = contact.imageData {
            self.profileImage = UIImage(data: imageData)
        }
        
        self.phoneNumber = phoneNumber.value.stringValue
    }
    
    open func displayName() -> String {
        return firstName + " " + lastName
    }
    
    open func contactInitials() -> String {
        var initials = String()
        
        if let firstNameFirstChar = firstName.characters.first {
            initials.append(firstNameFirstChar)
        }
        
        if let lastNameFirstChar = lastName.characters.first {
            initials.append(lastNameFirstChar)
        }
        
        return initials
    }
}
