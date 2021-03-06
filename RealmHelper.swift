//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Sahith Bhamidipati on 6/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func addAccount(account: Account){
        let realm = try! Realm()
        try! realm.write() {
            realm.add(account)
        }
    }
    
    static func deleteAccount(account: Account){
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(account)
        }
    }
    
    static func updateAccount(accountToBeUpdated: Account, newAccount: Account) {
        let realm = try! Realm()
        try! realm.write() {
            accountToBeUpdated.title = newAccount.title
            accountToBeUpdated.username = newAccount.username
            accountToBeUpdated.password = newAccount.password
        }
    }
    
    static func retrieveAccounts() -> Results<Account>{
        let realm = try! Realm()
        return realm.objects(Account).sorted("title", ascending: false)
    }
}