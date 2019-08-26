//
//  PersistenceManager.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 26/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import Disk

class PersistenceManager {
    func saveData(deals: [Deal], filename: String) {
        do {
            try Disk.save(deals, to: .documents, as: filename)
            print("Saved: \(filename)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func getData(_ filename: String) -> [Deal]? {
        do {
            let deals = try Disk.retrieve(filename, from: .documents, as: [Deal].self)
            print(">> \(deals.count)")
            return deals
        } catch {
            print("Error: \(error.localizedDescription) -- \(filename)")
        }
        return nil
    }
}
