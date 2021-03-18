//
//  CategoryViewController.swift
//  TaskToDo
//
//  Created by PC on 13/03/2021.
//  Copyright © 2021 db. All rights reserved.
//

import UIKit
import RealmSwift
import RevealingSplashView

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()

    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var Animation: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        //MARK: - animation loading
        let splashView = RevealingSplashView(iconImage: UIImage(named: "logo-TaskToDo")!, iconInitialSize: CGSize(width: 300, height: 300), backgroundImage: UIImage(named: "background")!)
        
        splashView.animationType = SplashAnimationType.squeezeAndZoomOut
        self.navigationController?.view.addSubview(splashView)
  
        splashView.startAnimation(){
            print("Completed")
            
        }
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        //loadCategory()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
               
        cell.textLabel?.text = categories[indexPath.row].name
               
               return cell
    }
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TaskToDoViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    
    //MARK: - Add New Categories
  
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            self.save(category: newCategory)
           
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Data Manipulation Methods
    
    func save(category: Category ) {
          
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error sav ing contex \(error)")
        }
        tableView.reloadData()
    }
      
//      func loadCategory() {
//        let request : NSFetchRequest<Category> = Category.fetchRequest()
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//        
//        tableView.reloadData()
//    }
    
}
