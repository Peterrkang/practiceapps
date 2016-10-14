//
//  ViewController.swift
//  DreamLister
//
//  Created by Peter Kang on 10/13/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //generateTestData()
        attemptFetch()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
        
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell

        
    }
    
    func configureCell(cell: ItemCell, indexPath: NSIndexPath) {
    
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(item: item)
        
        }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func attemptFetch(){
        
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
        do {
            try self.controller.performFetch()
        
        }catch {
            let error = error as NSError
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
        
        case.insert:
            if let indexPath = newIndexPath{
            tableView.insertRows(at: [indexPath], with: .fade)
            
            }
            break
        case.delete:
            if let indexPath = newIndexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
            break
        case.update:
            if let indexPath = indexPath{
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
                
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        }
        
    }
    
    func generateTestData(){
    
        let item = Item(context: context)
        item.title = "MacBookPro"
        item.price = 1800
        item.details = "I cant wait for my bday so i can go sleep forever and ever"
        
        let item2 = Item(context: context)
        item2.title = "MacBookNotPro"
        item2.price = 1000
        item2.details = "I cant wait for my bday so i can go sleep forever and ever and not forever"
        
        let item3 = Item(context: context)
        item3.title = "MacBookNotSoPro"
        item3.price = 1200
        item3.details = "I cant wait for my bday so i can go sleep forever and ever maybe in the future"
        
        let item4 = Item(context: context)
        item4.title = "Tesla"
        item4.price = 1300
        item4.details = "I cant wait for my bday so i can go sleep forever and ever maybe in the past"
        
        ad.saveContext()
    }
    
    

}
